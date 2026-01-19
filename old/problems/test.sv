`timescale 1ns/1ps

//=========================================
// APB INTERFACE
//=========================================
interface apb_if(input logic PCLK);

  logic PRESETn;
  logic PSEL;
  logic PENABLE;
  logic PWRITE;
  logic [31:0] PADDR;
  logic [31:0] PWDATA;
  logic [31:0] PRDATA;
  logic PREADY;

  modport drv (
    output PSEL, PENABLE, PWRITE, PADDR, PWDATA,
    input  PRDATA, PREADY, PCLK
  );

  modport mon (
    input PSEL, PENABLE, PWRITE, PADDR, PWDATA,
          PRDATA, PREADY, PCLK
  );

endinterface


//=========================================
// TRANSACTION
//=========================================
class apb_txn;

  rand bit        write;
  rand bit [31:0] addr;
  rand bit [31:0] data;

  bit [31:0] rdata;

  function void display();
    $display("TXN => W=%0d ADDR=%h WDATA=%h RDATA=%h",
              write, addr, data, rdata);
  endfunction

endclass


//=========================================
// DRIVER
//=========================================
//
//
// DESC: driver class for apb
class apb_driver;

  virtual apb_if.drv vif;
  mailbox #(apb_txn) gen2drv;

  function new(virtual apb_if.drv vif,
               mailbox #(apb_txn) gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction

  task drive();

    apb_txn txn;

    forever begin
      gen2drv.get(txn);

      // SETUP PHASE
      @(posedge vif.PCLK);
      vif.PSEL   <= 1;
      vif.PENABLE<= 0;
      vif.PWRITE <= txn.write;
      vif.PADDR  <= txn.addr;
      vif.PWDATA <= txn.data;

      // ENABLE PHASE
      @(posedge vif.PCLK);
      vif.PENABLE <= 1;

      // WAIT READY
      wait(vif.PREADY);

      // READ DATA
      if (!txn.write)
        txn.rdata = vif.PRDATA;

      // IDLE
      @(posedge vif.PCLK);
      vif.PSEL    <= 0;
      vif.PENABLE <= 0;
    end

  endtask

endclass


//=========================================
// MONITOR
//=========================================
class apb_monitor;

  virtual apb_if.mon vif;
  mailbox #(apb_txn) mon2sb;

  function new(virtual apb_if.mon vif,
               mailbox #(apb_txn) mon2sb);
    this.vif = vif;
    this.mon2sb = mon2sb;
  endfunction

  task run();

    apb_txn txn;

    forever begin
      @(posedge vif.PCLK);

      if (vif.PSEL && vif.PENABLE && vif.PREADY) begin

        txn = new();
        txn.write = vif.PWRITE;
        txn.addr  = vif.PADDR;
        txn.data  = vif.PWDATA;
        txn.rdata = vif.PRDATA;

        mon2sb.put(txn);
      end
    end

  endtask

endclass


//=========================================
// SCOREBOARD
//=========================================
class apb_scoreboard;

  mailbox #(apb_txn) mon2sb;
  bit [31:0] mem [bit[31:0]];

  function new(mailbox #(apb_txn) mon2sb);
    this.mon2sb = mon2sb;
  endfunction

  task run();

    apb_txn txn;

    forever begin
      mon2sb.get(txn);

      if (txn.write) begin
        mem[txn.addr] = txn.data;
        $display("SB WRITE PASS : %h = %h",
                  txn.addr, txn.data);
      end
      else begin
        if (mem.exists(txn.addr)) begin
          if (mem[txn.addr] == txn.rdata)
            $display("SB READ PASS  : %h = %h",
                      txn.addr, txn.rdata);
          else
            $error("SB READ FAIL : %h exp=%h got=%h",
                   txn.addr, mem[txn.addr], txn.rdata);
        end
      end

    end

  endtask

endclass


//=========================================
// COVERAGE
//=========================================
class apb_coverage;

  virtual apb_if.mon vif;

  covergroup apb_cg @(posedge vif.PCLK);

    coverpoint vif.PWRITE {
      bins READ  = {0};
      bins WRITE = {1};
    }

    coverpoint vif.PADDR {
      bins LOW  = {[0:1023]};
      bins HIGH = {[1024:2047]};
    }

    cross vif.PWRITE, vif.PADDR;

  endgroup

  function new(virtual apb_if.mon vif);
    this.vif = vif;
    apb_cg = new();
  endfunction

endclass


//=========================================
// AGENT
//=========================================
class apb_agent;

  apb_driver  drv;
  apb_monitor mon;

  mailbox #(apb_txn) gen2drv = new();
  mailbox #(apb_txn) mon2sb  = new();

  function new(virtual apb_if vif);

    drv = new(vif, gen2drv);
    mon = new(vif, mon2sb);

  endfunction

  task run();
    fork
      drv.drive();
      mon.run();
    join_none
  endtask

endclass


//=========================================
// ENVIRONMENT
//=========================================
class apb_env;

  apb_agent agent;
  apb_scoreboard sb;
  apb_coverage cov;

  function new(virtual apb_if vif);

    agent = new(vif);
    sb    = new(agent.mon2sb);
    cov   = new(vif);

  endfunction

  task run();

    agent.run();

    fork
      sb.run();
    join_none

  endtask

endclass


//=========================================
// TEST
//=========================================
class apb_test;

  apb_env env;

  function new(virtual apb_if vif);
    env = new(vif);
  endfunction

  task run();

    apb_txn txn;

    env.run();

    // WRITE TRANSACTIONS
    repeat (5) begin
      txn = new();
      txn.write = 1;
      txn.addr  = $urandom_range(0,100);
      txn.data  = $random;
      env.agent.gen2drv.put(txn);
    end

    // READ TRANSACTIONS
    repeat (5) begin
      txn = new();
      txn.write = 0;
      txn.addr  = $urandom_range(0,100);
      env.agent.gen2drv.put(txn);
    end

  endtask

endclass


//=========================================
// SIMPLE APB SLAVE DUT
//=========================================
module apb_slave (
  input  logic        PCLK,
  input  logic        PRESETn,
  input  logic        PSEL,
  input  logic        PENABLE,
  input  logic        PWRITE,
  input  logic [31:0] PADDR,
  input  logic [31:0] PWDATA,
  output logic [31:0] PRDATA,
  output logic        PREADY
);

  logic [31:0] mem [0:255];

  assign PREADY = 1'b1;

  always @(posedge PCLK) begin
    if (!PRESETn) begin
      PRDATA <= 0;
    end
    else if (PSEL && PENABLE) begin

      if (PWRITE)
        mem[PADDR] <= PWDATA;
      else
        PRDATA <= mem[PADDR];

    end
  end

endmodule


//=========================================
// TOP
//=========================================
module top;

  logic PCLK = 0;
  always #5 PCLK = ~PCLK;

  apb_if apb(PCLK);

  apb_slave dut (
    .PCLK   (PCLK),
    .PRESETn(apb.PRESETn),
    .PSEL   (apb.PSEL),
    .PENABLE(apb.PENABLE),
    .PWRITE (apb.PWRITE),
    .PADDR  (apb.PADDR),
    .PWDATA (apb.PWDATA),
    .PRDATA (apb.PRDATA),
    .PREADY (apb.PREADY)
  );

  apb_test test;

  initial begin

    apb.PRESETn = 0;
    #20 apb.PRESETn = 1;

    test = new(apb);
    test.run();

    #500 $finish;
  end

endmodule

