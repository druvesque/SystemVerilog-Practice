class foo;
    int i;
endclass

class bar;
    foo a;
    task copy(foo a);
        this.a = new a;
    endtask
endclass

program c10_tb;
    initial begin
        bar b1, b2;
        b1 = new();
        b1.a = new();
        b1.a.i = 190;
        b2 = new b1;
        b2.copy(b1.a);
        $display(b1.a.i);
        $display(b2.a.i);
        b1.a.i = 091;
        $display(b1.a.i);
        $display(b2.a.i);
    end
endprogram
