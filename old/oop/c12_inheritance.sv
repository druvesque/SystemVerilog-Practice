class Packet;
    integer i = 1;
    function integer get();
        get = i;
    endfunction
endclass

class LinkedPacket extends Packet;
    integer i = 2;
    function integer get();
        get = -i;
    endfunction
endclass

program c12_tb;
    integer j;
    LinkedPacket lp = new;
    Packet p = lp;
    initial begin
        j = p.i;
        $display("p.i: %0d", j);
        j = p.get();
        $display("p.get: %0d", j);
        j = lp.i;
        $display("lp.i: %0d", j);
        j = lp.get();
        $display("lp.get: %0d", j);
    end
endprogram
