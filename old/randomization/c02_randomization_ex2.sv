class exercise1;
    rand bit [7:0] data;
    rand bit [3:0] addr;
    constraint c1 {
        addr > 2;
        addr <= 4;
    } 
    // constraint c2 {
    //     addr >= 5;
    // }
endclass

program c02_tb;
    exercise1 ex1;
    initial begin
        ex1 = new();
        repeat(5)
        begin
            if (ex1.randomize)
                $display("randomize: data = %d, addr = %d", ex1.data, ex1.addr);
            else
                $display("Randomization fail");
        end
    end
endprogram
