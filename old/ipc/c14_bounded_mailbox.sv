program automatic c14_tb;
    mailbox mbx;
    initial begin
        mbx = new(1);
        fork
            for (int i = 1; i < 4; i++) begin
                $display("Time: %g, Producer: putting %0d", $time, i);
                mbx.put(i);
                $display("Time: %g, Producer: put(%0d) done %0d", $time, i , i);
            end
            repeat(3) begin
                int j;
                #1ns mbx.get(j);
                $display("Time: %g, Consumer: got %0d", $time, j);
            end
        join_any
    end
endprogram
