module df_ex2;
    initial begin
        $display("-----------------------------------------------------");
        fork
            begin
                $display("Time: %g, Process-1 of fork-2 started", $time);
                #4;
                $display("Time: %g, Process-1 of fork-2 finished", $time);
            end
            begin
                $display("Time: %g, Process-2 of fork-2 started", $time);
                #15;
                $display("Time: %g, Process-2 of fork-2 started", $time);
            end
        join_none
        fork
            begin
                $display("Time: %g, Process-1 of fork-1 started", $time);
                #5;
                $display("Time: %g, Process-1 of fork-1 finished", $time);
            end
            begin
                $display("Time: %g, Process-2 of fork-1 started", $time);
                #20;
                $display("Time: %g, Process-2 of fork-1 finished", $time);
            end
        join_any
        disable fork;
        $display("-------------------------------------------------------");
        $display("Time: %g, After disable-fork", $time);
        $display("-------------------------------------------------------");
    end
endmodule
