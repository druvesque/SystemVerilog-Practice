module top;
    timeunit 1ns;
    timeprecision 1ns; 
    dut_if bus();
    memory dut(bus);
    memory_tb tb(bus);
endmodule
