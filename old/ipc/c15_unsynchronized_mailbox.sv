program automatic c15_tb;
    class Producer;
        task run;
            for (int i = 1; i < 4; i++) begin
                $display("Producer: before put(%0d)", i);
                mbx.put(i);
            end
        endtask
    endclass
    class Consumer;
        task run;
            int i;
            repeat(3) begin
                mbx.get(i);
                $display("Consumer: after get(%0d)", i);
            end
        endtask
    endclass

    mailbox mbx;
    Producer p;
    Consumer c;
    initial begin
        mbx = new;
        p = new;
        c = new;
        fork
            p.run;
            c.run;
        join
    end
endprogram
