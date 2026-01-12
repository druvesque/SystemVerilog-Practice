class B;
    static int count =  0;
    function new();
        count++;
    endfunction
endclass

program tb;
    B b1, b2;
    initial begin
        b1 = new;
        $display("First count is = %d", b1.count);
        b2 = new;
        $display("Second count = %d", b2.count);
        b2 = null;
        $display("First count is = %d", b1.count);
        $display("Second count = %d", b2.count);
    end
endprogram
