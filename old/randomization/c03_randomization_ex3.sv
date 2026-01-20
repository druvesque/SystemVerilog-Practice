class parent;
    rand integer bar;
    constraint range {
        bar > 0;
        bar < 10;
    }
endclass

class subclass extends parent;
    constraint range {
        bar > 10;
        bar < 20;
    }
endclass

program c03_tb;
    subclass j;
    initial begin
        j = new();
        for (int i = 0; i < 10; i++)
            if (j.randomize())
                $display("Value : bar = %0d", j.bar);
            else
                $display("fail");
    end
endprogram
