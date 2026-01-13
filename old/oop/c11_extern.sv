class PCI_Tran;
    bit [31:0] addr, data;
    extern function void display();
endclass

function void PCI_Tran::display();
    $display("Time: %g, PCI: addr = %h, data = %h", $time, addr, data);
endfunction

typedef PCI_Tran my_class;

program c11_tb;
    initial begin
        my_class me;
        me = new;
        me.display();
    end
endprogram
