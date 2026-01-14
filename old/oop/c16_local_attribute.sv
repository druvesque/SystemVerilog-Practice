class register;
    local int data;
    task set(int i);
        data = i;
    endtask
    function int get();
        return data;
    endfunction
endclass: register

program c16_tb;
    // register c1 = new(); solution - 1 of warning
    // solution - 4 of warning
    register c1;
    initial begin
        c1 = new();
        // static register c1 = new(); // solution - 2 of warning 
        // solution -3 of warning
        // register c1;
        // c1 = new();
        // c1.data = 3; // illegal
        c1.set(3);   // legal
        $display("c1.data: %0d", c1.get());
    end
endprogram



