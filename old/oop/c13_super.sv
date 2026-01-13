class Packet;
    integer value;
    function integer delay();
        delay = value * value;
    endfunction
endclass

class LinkedPacket extends Packet;
    integer value;
    function integer delay();
        delay = super.delay() + value * super.value;
    endfunction
endclass

class PacketLinkedPacket extends LinkedPacket;
    integer value;
    function integer delay();
        delay = super.delay() + value * super.value;
    endfunction
endclass
