module top;
    dut_if bus();
    memory dut(bus);
    memory_tb tb(bus);
endmodule
