program c07_tb;
    bit [0:2] y;
    bit [0:2] values[$] = '{3, 5, 6};
    covergroup cg;
        cover_point_y: coverpoint y {
            bins a[2] = {[0:3], [4:7]};
            // bins a[] = {[0:7]};
            // bins a[4] = {[0:7]};
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
