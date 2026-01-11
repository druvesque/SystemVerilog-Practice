`timescale 1ns/1ns
module cpu(bus.CPU cpu_bus);
	logic [1:0] clk;
	logic rq,start;
	logic gnt,rdy;
	logic [1:0] mode;
	logic [7:0]addr;
	logic [cpu_bus.DWIDTH-1:0] data;
endmodule 

module Mem(bus.MEM mem_bus);
	logic [1:0] clk;
	logic rq,start;
	logic gnt,rdy;
	logic [1:0] mode;
	logic [7:0]addr;
	logic [7:0] data;

endmodule  

interface bus#(parameter int DWIDTH = 8) (input bit clk);
	logic rq,start;
	logic gnt,rdy;
	logic [1:0] mode;
	logic [7:0]addr;
	logic [7:0] data;
modport CPU(output rq,start,input gnt,rdy,output mode,output addr,inout data);
modport MEM(input rq,start,output gnt,rdy,input mode,input addr,inout data);
endinterface
