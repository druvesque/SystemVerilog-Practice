program c12_tb;
    reg [0:1] y;
    reg [0:1] values[$] = '{2'b00, 2'b01, 2'b10, 2'b11};
    covergroup cg;
        cover_point_y: coverpoint y {
            wildcard bins trans = (2'b0X => 2'b1X);
            }
    endgroup
    cg cg_inst = new();
    initial
        foreach(values[i])
        begin
            y = values[i];
            cg_inst.sample();
        end
endprogram
