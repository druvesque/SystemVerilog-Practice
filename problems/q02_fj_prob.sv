module q2;
    initial begin
        $display("Time: %g, starting of example, 1st display statement", $time);
        #10 $display("Time: %g, 2nd display statement (outside fork-join block)", $time);
        fork
            $display("Time: %g, parallel start", $time);
            #10 $display("Time: %g, parallel start after #10", $time);
            #50 $display("Time: %g, parallel start after #50", $time);
            begin
                #30 $display("Time: %g, sequential after #30", $time);
                #10 $display("Time: %g, sequential after #10", $time);
            end
        join
        $display("Time: %g, after join", $time);
        #80 $display("Time: %g, final after #80", $time);
    end
endmodule
