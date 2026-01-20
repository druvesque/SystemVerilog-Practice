class Bus;
    rand bit [15:0] addr;
    // bit [15:0] addr;    Try with this too, randomization failed
    randc bit [1:0] data;
    constraint range1 {
        addr > 1024;
        addr < 1029;
    }
endclass

program c01_tb;
    Bus bus;
    integer i = 0;
    initial begin
        bus = new;
        repeat(150) begin
            if (bus.randomize() == 1)
                $display("i: %0d, addr = %0d, data = %0d", i, bus.addr, bus.data);
            else
                $display("Randomization failed");
            i = i + 1;
        end
    end
endprogram
