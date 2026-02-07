module c06_tb;
    reg [3:0] a;
    initial
        a <= 5;
    initial
        a <= 6;
    initial
        a <= 2;
    initial
        a <= 4;
    initial begin
        $display("Time: %g, display, a: %0d", $time, a);
        $monitor("Time: %g, monitor, a: %0d", $time, a);
    end
endmodule
