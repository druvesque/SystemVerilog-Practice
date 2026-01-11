`timescale 1ns/1ns
module memory (dut_if.DUT bus);

     logic [bus.WWIDTH-1:0] r_data;
     logic [bus.WWIDTH-1:0] w_data;
     logic [bus.AWIDTH-1:0] addr;
     logic                  read;
     logic                  write;

	logic [bus.WWIDTH-1:0] mem [2**bus.AWIDTH];  // A=5, W=8 => [7:0] mem[32];
	assign r_data = read ? mem[addr]:'z;
	always@(posedge write)
		mem[addr]<=w_data;

endmodule :memory 
