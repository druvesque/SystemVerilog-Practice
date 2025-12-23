module example13;
    bit [7:0] up_array[3];
    bit [31:0] abc[5] = '{5, 6, 7, 5, 5};

    initial begin
        up_array[0] = '0;
        up_array[1] = '1;
        up_array[2] = '0;
        up_array[2][3] = 1;
    end

    initial begin
        $display("\nup_array[0]: %b\nup_array[1]: %b\nup_array[2]: %b\n\n", up_array[0], up_array[1], up_array[2]);
        
        $display("abc[1]: %b\nabc[3][0]: %b\nabc[2][3:1]: %b", abc[1], abc[3][0], abc[2][3:1]);
    end
endmodule
