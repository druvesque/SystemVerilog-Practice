class parent;
    task print_1();
        $display(" THIS IS PARENT CLASS ");
    endtask
endclass

class subclass extends parent;
    task print_1();
        $display(" THIS IS SUBCLASS ");
    endtask
endclass

program c14_tb;
    initial begin
        parent d;
        subclass c;
        d = new();
        c = new();
        d.print_1();
        c.print_1();
    end
endprogram
