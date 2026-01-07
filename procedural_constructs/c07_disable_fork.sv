module disable_fork;
    task sub_process;
        fork
            begin
                $display("Time: %g, Sub-Process Started", $time);
                #10;
                $display("Time: %g, Sub-Process Finished", $time);
            end
            begin
                $display("t1: %g", $time);
                #20;
                $display("t2: %g", $time);
            end
        join
    endtask
    initial begin
        $display("----------------------------------------------");
        fork
            begin
                $display("Time: %g, Process-1 of fork-1 started", $time);
                #5;
                $display("Time: %g, Process-1 of fork-1 finished", $time);
            end
            begin
                sub_process();
            end
        join_any
        $display("---------------------------------------------");
        $display("Time: %g, After disable-fork", $time);
        $display("---------------------------------------------");
    end
endmodule
