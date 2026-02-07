module c08_tb;
    event a, b;
    initial begin
        $display("forking off");
        fork
            ->> a;
            @a;
            -> b;
            wait(b.triggered);  // try @b
        join
        $display("joining");   
    end
endmodule
