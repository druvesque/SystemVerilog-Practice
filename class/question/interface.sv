`timescale 1ns/1ns
interface dut_if #(parameter int unsigned WWIDTH = 8, parameter int unsigned AWIDTH = 5);
    
    logic [WWIDTH - 1 : 0] data;
    logic [AWIDTH - 1 : 0] addr;
    logic                  read;
    logic                  write;
    logic [WWIDTH -1 :0]   data_w;

    modport DUT(output data, input addr, input read, input write);
    modport tb_ports(output data, input addr, input read, input write, input data_w, import read_mem, import write_mem, import print_status); 

    task write_mem (input [AWIDTH-1:0] waddr,
		            input [WWIDTH-1:0] wdata,
		            input debug = 0);

	write = 0;
	read = 0;
	addr = waddr;
	data_w = wdata;
	#5ns write = 1;
	if (debug == 1)
		$display("%t: write address: %d, data = %h", $time,waddr,wdata);
	#5ns write=0;
  endtask 
 
  task read_mem ( input [AWIDTH-1:0] raddr,
		          output [WWIDTH-1:0] rdata,
		          input debug = 0);
	write = 0;
	read = 1;
	addr = raddr;
	#5ns rdata = data;
     	if (debug == 1)
		$display("%t, read address: %d,data=%h",$time,raddr,rdata);
	#5ns read = 0;
  endtask 

  function void print_status (input int unsigned status);
	$display("Memory Test %s with %0d errors",status? "FAILED":"PASSED",status);
	if (status !=0)
	  $finish;
  endfunction 

endinterface
