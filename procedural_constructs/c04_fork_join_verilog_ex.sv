module fj_v_ex;

    reg       a, b;
    reg [1:0] c;
    reg [2:0] d;

    initial begin
        fork
            a = 1'b0;
            #10 b = 1'b1;
        join
        fork
            #5 b = 1'b0;
            #10 c = {a, b};
        join
        #20 d = {a, c};
    end

    initial begin
        #60 $finish;
    end

    initial begin
        $monitor("time: %g, a: %b, b: %b, c: %b, d: %b", $time, a, b, c, d);
    end
endmodule
