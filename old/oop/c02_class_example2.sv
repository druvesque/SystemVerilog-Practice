class BusTran;
    bit [31:0] addr, crc, data[8];
    function void display;
        $display("BusTran: %h %h", addr, crc);
    endfunction: display
endclass

class PCITran;
    bit [31:0] addr, data[8];
    function void display;
        $display("PCITran: %h %p", addr, data);
    endfunction: display
endclass

program tb;
    BusTran b;
    PCITran pc;
    initial begin
        b = new();
        b.display();
        pc = new();
        pc.display();
    end
endprogram
