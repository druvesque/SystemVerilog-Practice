`timescale 1ns/1ns
module memory (dut_if.DUT bus);

     logic [bus.WWIDTH-1:0] data; 
     logic [bus.AWIDTH-1:0] addr;
     logic              read;
     logic              write;

	 // timeunit 1ns;
	 // timeprecision 1ns;

	logic [bus.WWIDTH-1:0] mem [2**bus.AWIDTH];  // A=5, W=8 => [7:0] mem[32];
	assign data = read ? mem[addr]:'z;
	always@(posedge write)
		mem[addr]<=data;

endmodule :memory 
