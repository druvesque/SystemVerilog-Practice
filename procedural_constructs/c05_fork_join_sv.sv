module fj_sv;
    event eventA;
    initial
        #25ns -> eventA;

    initial begin
        fork
            begin
                $display("Time: %g, First Block\n", $time);
                #20ns;
                $display("Time: %g, First Block Ends\n", $time);
            end
            begin
                $display("Time: %g, Second Block\n", $time);
                @eventA;
                $display("Time: %g, Second Block End\n", $time);
            end
        join
        $display("Time: %g, Outside the fork-join block\n", $time);
    end
endmodule
