class polygon;
    protected int width;
    protected int height;
    function void set_values(int a, int b);
        width = a; height = b;
    endfunction
    virtual function int area();
    endfunction
endclass

class rectangle extends polygon;
    function int area();
        area = (width * height);
    endfunction
endclass

class triangle extends polygon;
    function int area();
        area = (width * height) / 2;
    endfunction
endclass

program c19_tb;
    polygon poly[5];
    rectangle rect = new;
    triangle trig = new;
    initial begin
        poly[0] = rect;
        poly[1] = trig;
        poly[0].set_values(3, 6);
        poly[1].set_values(3, 6);
        $display("Rect area: %0d", poly[0].area());
        $display("Trig area: %0d", poly[1].area());
    end
endprogram
