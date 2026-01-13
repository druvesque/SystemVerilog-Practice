class A;
    static int a_count = 0;
    int tr;
    function new;
        tr = a_count++;
    endfunction
endclass

program c08_tb;
    A a1, a2;
    initial begin
        a1 = new;
        a2 = new;
        $display("tr = %0d, a_count: %0d", a2.tr, a2.a_count);
    end
endprogram
