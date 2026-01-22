module q01_tb;
    reg a, b, c, d, e, f;
    covergroup q1;
        coverpoint a;
        coverpoint b;
        coverpoint c;
        coverpoint d;
        coverpoint e;
        coverpoint f;
    endgroup
    initial begin
        #5 a = 0;
        #5 a = 1;
        c = 0;
        b = 1;
    end
    always @(posedge a)
    begin
        c = b && a;
        if (c && f)
            b = e;
        else
            e = b;
        case(c)
            1: f = 1;
            0: f = 0;
            default: f = 0;
        endcase
    end
endmodule
