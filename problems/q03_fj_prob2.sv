module q3;
    task print_val(
        input [7:0] value,
        input [7:0] delay
    );
    begin
        $display("Pre-Display, Value: %0d, Delay: %0d", value, delay);
        #(delay) $display("Time: %g, Passed Value: %d, Delay Value: %d", $time, value, delay);
        $display("Post Display, Value: %0d, Delay: %0d", value, delay);
    end
    endtask

    initial begin
        fork
            print_val(10, 7);
            print_val(8, 5);
            print_val(4, 2);
            print_val(1, 1);
        join
        $display("Time: %g, Out of fork-join", $time);
    end
endmodule
