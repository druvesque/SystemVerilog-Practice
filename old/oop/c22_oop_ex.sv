typedef enum {RED, BLUE, BLACK, WHITE} color_t;

virtual class sport_coupe;
    color_t color;
    virtual function void print();
        $display("I am %s sport_coupe", color.name());
    endfunction
endclass

class K extends sport_coupe;
    virtual function void print();
        $display("I am %s K motors", color.name());
    endfunction
endclass

class M extends sport_coupe;
    virtual function void print();
        $display("I am %s M motors", color.name());
    endfunction
endclass

program c22_tb;
    task print_all(sport_coupe cars[]);
        for (int i = 0; i < cars.size(); i++)
            cars[i].print;
    endtask
    initial begin
        K k;
        M m;
        sport_coupe cars[4];
        k = new();
        k.color = BLUE;
        m = new();
        m.color = WHITE;
        cars[0] = m;
        cars[1] = k;
        cars[2] = m;
        cars[3] = k;
        print_all(cars);
    end
endprogram


