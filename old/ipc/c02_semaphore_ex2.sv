program c02_tb;
    semaphore sem;
    initial begin
        sem = new(2);
        begin
            sem.get(1);
            begin
                $display("Time: %g, EVENT 3", $time);
                sem.put(1);
            end
            sem.get(2);
            $display("Time: %g, EVENT 1", $time);
            sem.get(1);
            begin
                $display("Time: %g, EVENT 2", $time);
                sem.put(1);
            end
        end
    end
endprogram
