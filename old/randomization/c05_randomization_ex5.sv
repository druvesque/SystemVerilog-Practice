class Class_t;
    rand int var1;
    int var2;
endclass

class rand_class;
    rand Class_t cla;
    function new();
        cla = new();
    endfunction
endclass

program c05_tb;
    rand_class rc = new();
    initial 
        repeat(10)
            if(rc.randomize())
                $display("var1: %0d, var2: %0d", rc.cla.var1, rc.cla.var2);
endprogram
