module memory_tb (dut_if.tb_ports tp);

  timeunit 1ns;
  timeprecision 1ns;
  
  logic [7:0]        r_data;
  logic              read;
  logic              write;
  logic [4:0]        addr;
  logic [tp.WWIDTH-1:0] data_w;

  memory memo(.*); 

  assign data=read ? 'z :data_w;
  localparam bit debug = 1;
   
  initial begin 
	logic [tp.WWIDTH-1:0] data_read;
	int unsigned errors;
	$timeformat(-9,0,"ns",6);
	$display("CLEAR THE MEMORY FIRST");
	errors =0;
	for (int i =0;i<=2**tp.AWIDTH-1;++i)	
		tp.write_mem(i,0,0);
	for (int i=0;i<=2**tp.AWIDTH-1;++i)
		begin 
		  tp.read_mem(i,data_read,0);
		  if(data_read!==0)
		     ++errors;
		end 
	tp.print_status(errors);
	$display("TEST DATA = ADDRESS");
	errors = 0;
	for (int i = 0;i<=2**tp.AWIDTH-1;++i)
		tp.write_mem(i,i,debug);
	for (int i = 0;i<=2**tp.AWIDTH-1;++i)
		begin 
		  tp.read_mem(i,data_read,debug);
		  if (data_read !=i)
		      ++errors;
		end 
	tp.print_status(errors);
	$finish(0);
	end 

endmodule:memory_tb
