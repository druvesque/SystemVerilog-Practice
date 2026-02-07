module q1_tb;
    event e1;
    initial
        fork
            #1 @e1; $display ("E1 event triggered");
            #2 -> e1;
            #3 e1 = null;
            #4 @e1; $display("E1 event triggered");
            #5 -> e1; $display(e1.triggered);
        join
endmodule

module q2_tb;
    event e1, e2;
    initial
        fork
            #1 e2 = e1;
            #2 @e1 $display("E1 event triggered");
            #2 @e2 $display("E2 event triggered");
            #3 -> e2;
        join
endmodule

module q3_tb;
    event e1, e2;
    initial
        fork
            #1 e2 = e1;
            #1 @e1 $display("E1 event triggered");
            #2 @e2 $display("E2 event triggered");
            #3 -> e2;
        join
endmodule

module q4_tb;
    event e1, e2;
    initial fork
        // e1 = null
        @e1;
        wait (e1.triggered);
        -> e1;
        $display("E1 event trigger happened");
        if (e1)
            e2 = e1;
        if (e1 == e2)
            $display("E1 and E2 are the same event");
    join
endmodule
