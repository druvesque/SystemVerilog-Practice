class foo;
    int N = 3;
    function int fetch_N();
        return N;
    endfunction
endclass

class bar extends foo;
    int N = 4;
    function int fetch_N();
        return N;
    endfunction
    function int fetch_N1();
        return super.N;
    endfunction
endclass

program c15_tb;
    bar e = new;
    foo b = e;
    initial begin
        $display(b.fetch_N());
        $display(e.fetch_N());
        $display(e.fetch_N1());
    end
endprogram
