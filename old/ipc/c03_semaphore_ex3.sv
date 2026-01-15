program c03_tb;
    semaphore sem = new(1);
    initial begin
        fork
            begin
                #10; 
                $display("Time: %g, 1: waiting for key", $time);
                sem.get(1);
                $display("Time: %g, 1: got key", $time);
                #10;
                sem.put(1);
                $display("Time: %g, 1: return back key", $time);
                #10;
                $display("Time: %g, p1 ends here", $time);
            end
            begin
                $display("Time: %g, 2: waiting for key", $time);
                sem.get(1);
                $display("Time: %g, 2: got key", $time);
                #10;
                sem.put(1);
                $display("Time: %g, 2: returning back key, p2 ends here", $time);
            end
        join
        #100;
    end
endprogram
