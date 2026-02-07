module c09_tb;
    event e1, e2;
    initial
        fork
            while(1) @e2;
            while(1) @e1;
            begin
                e2 = e1;
                while(1) ->e2;
            end
        join
endmodule
