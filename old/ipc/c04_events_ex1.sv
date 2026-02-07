module c04_tb;
    event e1 ,e2;
    initial begin
        $display("Time: %g, 1: before trigger", $time);
        -> e1;
        @e2;
        $display("Time: %g, 1: after trigger", $time);
    end
    initial begin
        $display("Time: %g, 2: before trigger", $time);
        -> e2;
        @e1;
        $display("Time: %g, 2: after trigger", $time);
    end
endmodule
