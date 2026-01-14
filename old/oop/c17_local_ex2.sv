class foo;
    local int x;
    task set(int y);
        x = y;
        $display(x);
    endtask
endclass

module c17_tb;
    foo b;
    initial begin
        // foo b;
        b = new();
        b.set(123);
        b = null;
        $display(b);
    end
endmodule
