virtual class Parent;
    task print_1();
        $display("Parent class");
    endtask
endclass

class subclass extends Parent;
    task print_1();
        $display("Subclass class");
    endtask
endclass

program c23_tb;
    subclass ea;
    Parent a;
    initial begin
        ea = new();
        a = ea;
        ea.print_1();
        a.print_1(); 
        // a = new();   // this will not work as the class is abstract
        // a.print_1();
    end
endprogram
