class A;
    integer j = 5;
endclass

class B;
    integer i = 1;
    A a = new;
endclass

program tb;
    B b1, b2;
    initial begin
        b1 = new();
        b2 = new b1;
        b2.i = 10;
        b2.a.j = 50;
        $display(b1.i, b2.i);
        $display(b1.a.j, b2.a.j);
    end
endprogram
