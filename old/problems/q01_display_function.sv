// NOTE: Attempt with monitor and strobe
module q1;
    reg clk = 0;
    reg a;

    always
        #5 clk = ~clk;

    always @(posedge clk) begin
        a <= 1;
        a = ~a;
    end

    always @(posedge clk) begin
        $strobe("Time: %g, a: %b", $time, a);
        #30 $finish;
    end
endmodule
