module df_ex3;
    initial begin
        #(10);
        $display("BEFORE fork, time: %g", $time);
        fork
            begin
                #(20);
                $display("Time: %g, #20", $time);
            end
            begin
                #(10);
                $display("Time: %g, #10", $time);
            end
            begin
                #(5);
                $display("Time: %g, #5", $time);
            end
        join_none
        $display("Time: %g, Outside the main fork", $time);
        disable fork;
        $display("Killed the child process");
    end
    initial
        #100 $finish;
endmodule
