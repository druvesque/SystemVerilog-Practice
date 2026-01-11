`timescale 1ns/1ns
module memory_tb (dut_if.tb_ports tp);
 
  localparam bit debug = 1;
   
  initial begin 
	int unsigned errors;
	$timeformat(-9,0,"ns",6);
	$display("CLEAR THE MEMORY FIRST");
	errors = 0;

    for (int i = 0; i <= 2**tp.AWIDTH-1; ++i) begin	
		tp.write_mem(i,0,0);
    end

	for (int i = 0; i <= 2**tp.AWIDTH-1; ++i)
		begin 
		  tp.read_mem(i, tp.r_data, 0);
		  if(tp.r_data !== 0)
		     ++errors;
		end 

	tp.print_status(errors);
	$display("TEST DATA = ADDRESS\n");
	errors = 0;

	for (int i = 0; i <= 2**tp.AWIDTH-1; ++i)
		tp.write_mem(i , i, debug);
    $display("\n");
	for (int i = 0; i <= 2**tp.AWIDTH-1; ++i)
		begin 
		  tp.read_mem(i, tp.r_data, debug);
		  if (tp.r_data != i)
		      ++errors;
		end 

	tp.print_status(errors);
	$finish(0);
	end 

endmodule:memory_tb
