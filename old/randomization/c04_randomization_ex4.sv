class A;
    rand integer Var;
endclass

class B;
    rand A obj_1 = new();
    A obj_2 = new();
endclass

program c04_tb;
    B obj = new();
    initial begin
        obj.obj_1.Var = 1;
        obj.obj_2.Var = 1;
        repeat(10) begin
            void'(obj.randomize());
            $display("var1 = %d, var2 = %d", obj.obj_1.Var, obj.obj_2.Var);
        end
    end
endprogram
