class foo;
    virtual task print_1 ();
        $display("class foo");
    endtask
endclass

class bar1 extends foo;
    task print_1();
        $display("class bar1");
    endtask
endclass

class bar2 extends bar1;
    task print_1();
        $display("class bar2");
    endtask
endclass

program c21_tb;
    bar2 my_ea;
    bar1 my_a;
    initial begin
        my_ea = new();
        my_a = my_ea;
        my_a.print_1();
        just(my_a);
    end
endprogram

task just(foo my_a);
    bar1 loc;
    my_a.print_1();
    $cast(loc, my_a);
    loc.print_1();
    loc = new();
    loc.print_1();
    // loc = null;
    // loc.print_1();
endtask
