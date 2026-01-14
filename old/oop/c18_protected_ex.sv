class A;
    integer data;
    local integer addr;
    protected integer cmd;
    static integer cred;

    function new();
        begin
            data = 100;
            addr = 200;
            cmd = 1;
            cred = 10;
        end
    endfunction

    task printA();
        $write("value of data %0d in A\n", data);
        $write("value of addr %0d in A\n", addr);
        $write("value of cmd %0d in A\n", cmd);
    endtask
    
endclass

class B extends A;
    task printB();
        begin
            $write("value of data %0d in B\n", data);
            // $write("value of addr %0d in B\n", addr);
            $write("value of cmd %0d in B\n", cmd);
        end
    endtask
endclass

class C;
    A a;
    B b;
    function new();
        begin
            a = new();
            b = new();
            b.data = 2;
        end
    endfunction
    task printC();
        $write("value of data %0d in C\n", a.data);
        $write("value of data %0d in C\n", b.data);
        // $write("value of addr %0d in C\n", a.addr);
        // $write("value of cmd %d0d in C\n", a.cmd);
        // $write("value of addr %0d in C\n", b.addr);
        // $write("value of cmd %0d in C\n", b.cmd);
    endtask
endclass

program c18_tb;
    initial begin
        C c;
        c = new();
        c.a.printA();
        c.b.printB();
        c.printC();
        $write("value of credits is %0d\n", c.a.cred);
        $write("value of credits is %0d\n", c.b.cred);
        c.a.cred++;
        $write("value of credits is %0d\n", c.a.cred);
        $write("value of credits is %0d\n", c.b.cred);
        c.b.cred++;
        $write("value of credits is %0d\n", c.a.cred);
        $write("value of credits is %0d\n", c.b.cred);
    end
endprogram
