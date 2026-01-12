class BusTran;

    bit [31:0] addr, crc, data [8];

    function void calc_crc(data);
        crc = addr ^ data;
        $display("CRC: %0d", crc);
    endfunction:calc_crc

    function void display;
        $display("BusTran: %h", addr);
    endfunction: display

endclass: BusTran

program tb;
    initial begin
        BusTran b;
        b = new;
        b.addr = 32'h42;
        b.display();
        for (int i = 0; i <= 7; i++)
            begin
                b.data[i] = i;
                b.calc_crc(b.data[i]);
            end
    end
endprogram
