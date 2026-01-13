class Transaction;
    static int count = 0;
    int id;
    function new();
        id = count++;
        $display("New from class called");
    endfunction
    function void destructor();
        count--;
    endfunction
endclass

program destructor_tb;
    Transaction b1, b2, b3;
    initial begin
        b1 = new;
        $display("b1.id: %0d, b1.count: %0d", b1.id, b1.count);
        b2 = new;
        $display("b2.id: %0d, b2.count: %0d", b2.id, b2.count);
        b3 = new;
        b2.destructor();
        b2 = null;
        $display("b3.id: %0d, b3.count: %0d", b3.id, b3.count);
        // $display("b2.id: %0d", b2.id);       this doesn't work, gives error
        $display("b2.count: %0d", b2.count); // this works
    end
endprogram
