typedef enum {A, B, C, D} alpha;
program c06_tb;
    alpha y;
    alpha value[$] = '{A, B, A, B};
    covergroup cg;
        cover_point_y: coverpoint y;
    endgroup
    cg cg_inst = new();
    initial begin
        foreach(value[i])
        begin
            y = value[i];
            cg_inst.sample();
        end
    end
endprogram


