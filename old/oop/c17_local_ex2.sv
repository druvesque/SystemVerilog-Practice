class foo;
    local int x;
    task set(int y);
        x = y;
        $display(x);
    endtask
endclass

program c17_tb;
    // foo b;
    initial begin
        foo b;
        b = new();
        b.set(123);
        b = null;
        #10
        $display(b);
        // b.set(1);
    end
endprogram
