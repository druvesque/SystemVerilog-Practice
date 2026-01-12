class Thing;
    int data;
endclass

program tb;
    Thing t1, t2, t3;
    initial begin
        t1 = new();
        t1.data = 1;
        t2 = new();
        t2.data = 2;
        t2 = t1;
        t2.data = 5;
        $display(t1.data);
        $display(t2.data);
    end
endprogram
