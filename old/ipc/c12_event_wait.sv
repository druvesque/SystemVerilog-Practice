module event_wait;
    event a;
    initial begin
        repeat(4)
            #20 -> a;
    end
    always begin
        @a;
        $display("time=%g ONE :: EVENT A is triggered", $time);
    end
    always begin
        wait(a.triggered);
        $display("time=%g TWO :: EVENT A is triggered", $time);
        #1;
    end
endmodule
