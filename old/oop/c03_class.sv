class abc;
    int x;
    int y;
    task print_1();
        $display(x, y);
    endtask
endclass

program tb;
    initial begin
        abc ob1, ob2;
        ob1 = new();
        ob2 = new();
        ob1.x = 2;
        ob1.y = 4;
        ob1.print_1();
        ob2.print_1();
    end
endprogram
