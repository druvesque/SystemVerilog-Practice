module c05_tb;
    event a;
    integer me = 0;

    always @a
        $display("Time: %g, me is %0d", $time, me);

    initial begin
        me <= 1;
        ->> a;    // try with ->
    end
endmodule
