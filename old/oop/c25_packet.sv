class Packet;
    local integer i;
    function integer compare(Packet other);
        compare = (this.i == other.i);
    endfunction
    function void set(integer i);
        this.i = i;
    endfunction
endclass

program c25_packet;
    integer retval;
    initial begin
        Packet p1, p2;
        p1 = new();
        p1.set(3);
        p2 = new();
        p2.set(4);
        retval = p2.compare(p1);
        $display(retval);
        p2.set(3);
        retval = p2.compare(p1);
        $display(retval);
    end
endprogram
