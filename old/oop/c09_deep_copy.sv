class base;
    int i;
endclass

program c09_tb;
    initial begin
        base b1, b2;
        b1 = new();
        b1.i = 190;
        b2 = new b1;
        b2.i = 091;
        $display(b1.i);
        $display(b2.i);
    end
endprogram
