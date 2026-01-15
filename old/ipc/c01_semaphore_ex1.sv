program c01_tb;
    semaphore semBus = new(1);
    initial begin
        fork 
            agent("AGENT 0", 5);
            agent("AGENT 1", 10);
            agent("AGENT 2", 15);
            agent("AGENT 3", 20);
        join
    end
    task automatic agent(string name, integer nwait);
        integer i = 0;
        for (i = 0; i < 4; i++) begin
            semBus.get(1);
            $display("Time: %g, Lock semBus for %s", $time, name);
            #(nwait);
            $display("Time: %g, Release semBus for %s", $time, name);
            semBus.put(1);
            #(nwait);
            $display("Time: %g, Task finish for %s", $time, name);
        end
    endtask
endprogram
