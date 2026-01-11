module wait_fork;
    initial begin
        $display("-------------------------------------------");
        fork
            // Process - 1
            begin
                $display("Time: %g, Process - 1 Started", $time);
                #5;
                $display("Time: %g, Process - 1 Finished", $time);
            end
            // Process - 2
            begin
                $display("Time: %g, Process - 2 Started", $time);
                #20;
                $display("Time: %g, Process - 2 Finished", $time);
            end
        join_any
        $display("Time: %g, -----------------------------------", $time);
        wait fork;
        $finish;
    end
endmodule
