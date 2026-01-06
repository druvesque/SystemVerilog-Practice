module q4;
    initial begin
        #10;
        $display("Time: %g, Before fork-join statement", $time);
        fork
            $display("Time: %g, fork start", $time);
            begin
                #20;
                $display("Time: %g, 20 time unit later fork", $time);
            end
            begin
                #5
                $display("Time: %g, 5 time unit later fork", $time);
            end
            begin
                #10;
                $display("Time: %g, 10 time unit later fork", $time);
            end
        join_none
        $display("Time: %g, outside of fork join", $time);
        #40;
    end
endmodule
