module example14;
    logic [16:1] b_unpack [1:3]; // try with bit / logic both (2 vs 4-state)
    int i;
    logic j;

    initial begin
        b_unpack[0] = '0;
        $display("\nwriting to non-existent location, b_unpack[0]: %b\n", b_unpack[0]);
        b_unpack[1] = '0;
        b_unpack[2] = '1;
        b_unpack[3] = '0;
        b_unpack[1][1] = b_unpack[2][3];
        b_unpack[3][16] = 1;
        $display("\nb_unpack[1]: %b\nb_unpack[2]: %b\nb_unpack[3]: %b\n", b_unpack[1], b_unpack[2], b_unpack[3]);
        i = b_unpack[3][0];
        $display("\nReading from non-existent location into a 2-state variable: %b", i);
        j = b_unpack[3][0];
        $display("\nReading from non-existent location into a 4-state variable: %b", j);
    end

endmodule
