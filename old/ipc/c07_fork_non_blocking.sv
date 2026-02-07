module c07_tb;
    reg [3:0] a;
    initial
        fork
            a <= 5;
            a <= 6;
            a <= 2;
            a <= 4;
        join
    initial begin
        $display("Time: %g, display, a: %0d", $time, a);
        $monitor("Time: %g, monitor, a: %0d", $time, a);
    end
endmodule

