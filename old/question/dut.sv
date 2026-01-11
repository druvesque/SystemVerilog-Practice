`timescale 1ns/1ns
module memory (dut_if.DUT bus);

	logic [bus.WWIDTH-1:0] mem [2**bus.AWIDTH];  // A=5, W=8 => [7:0] mem[32];
	assign bus.r_data = bus.read ? mem[bus.addr]:'z;
	always@(posedge bus.write)
		mem[bus.addr] <= bus.w_data;

endmodule :memory 
