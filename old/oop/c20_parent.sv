class Parent;
    virtual task print_1();
        $display("Parent Class");
    endtask
endclass

class subclass extends Parent;
    task print_1();
        $display("This is extended parent class");
    endtask
endclass

program c20_tb;
    Parent d;
    subclass ea;
    initial begin
        d = new();
        d.print_1();
        ea = new();
        ea.print_1();
        d = ea;
        d.print_1();
    end
endprogram
