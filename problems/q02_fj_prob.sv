module q2;
    initial begin
        $display("Time: %g, starting of example, 1st display statement", $time);          // PARENT THREAD
        #10 $display("Time: %g, 2nd display statement (outside fork-join block)", $time); // PARENT THREAD
        fork
            $display("Time: %g, parallel start", $time);                                  // CHILD THREAD - PARALLEL
            #10 $display("Time: %g, parallel start after #10", $time);                    // CHILD THREAD - PARALLEL
            #50 $display("Time: %g, parallel start after #50", $time);                    // CHILD THREAD - PARALLEL
            begin
                #30 $display("Time: %g, sequential after #30", $time);                    // CHILD THREAD - SEQUENTIAL
                #10 $display("Time: %g, sequential after #10", $time);                    // CHILD THREAD - SEQUENTIAL
            end
        join
        $display("Time: %g, after join", $time);                                          // PARENT THREAD
        #80 $display("Time: %g, final after #80", $time);                                 // PARENT THREAD
    end
endmodule
