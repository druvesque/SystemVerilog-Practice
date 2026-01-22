program c01_tb;
    bit [0:2] y;
    bit [0:2] values[$] = '{1, 2, 3, 5, 6, 32};

    covergroup cg;
        cover_point_y: coverpoint y;
    endgroup

    cg cg_inst = new();
    initial
        foreach(values[i])
        begin
            y = values[i];
            cg_inst.sample();
        end
endprogram
