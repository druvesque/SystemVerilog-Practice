module main_wait;
    event e1, e2;
    initial
        repeat(4)
        begin
            #20;
            ->> e1;
            @(e1)
            $display("e1 is triggered at @%g", $time);
        end

     initial
         repeat(4)
         begin
             #20;
             ->e2;
             wait(e2.triggered);
             $display("e2 is triggered at @%g", $time);
         end
endmodule
