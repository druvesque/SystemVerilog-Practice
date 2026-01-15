class foo #(int size = 3);
    bit [size:0] a;
    task print_1();
        $display("Size of the vector a is %d", $size(a));
    endtask
endclass

program c24_tb;
    initial begin
        foo f1;
        foo #(4) f2;
        foo #(5) f3;
        f1 = new();
        f2 = new();
        f3 = new();
        f1.print_1();
        f2.print_1();
        f3.print_1();
    end
endprogram
