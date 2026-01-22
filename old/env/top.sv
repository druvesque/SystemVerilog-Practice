module top;
    parameter simulation_cycle = 10;
    reg sys_clock;
    initial begin
        sys_clock = 0;
        forever begin
            #(simulation_cycle / 2)
            sys_clock = ~sys_clock;
        end
    end
    intf_io execute(sys_clock);
    execute_test test(execute);
    ones_counter dut(
                     .clk  (execute.clock),
                     .data (execute.data),
                     .reset(execute.reset),
                     .count(execute.count)
                    );
endmodule
