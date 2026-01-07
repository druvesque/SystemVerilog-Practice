module alu;
    int src1[0:4], src2[0:4];
    bit [2:0] alu_op[0:4];
    int aluin1, aluin2;
    bit [2:0] alu_operation;

    task gen();
        for (int i = 0; i <= 4; i++) begin
            src1[i] = $random;
            src2[i] = $random;
            alu_op[i] = $urandom_range(1, 6);
        end
    endtask

    task send();
        for (int i = 0; i <= 4; i++) begin
            aluin1 = src1[i];
            $display("sending src1[%0d] = %0d to aluin1", i, src1[i]);
            aluin2 = src2[i];
            $display("sending src2[%0d] = %0d to aluin2", i, src2[i]);
            alu_operation = alu_op[i];
            $display("sending alu_op[%0d] = %0d to alu operation", i, alu_op[i]);
        end
    endtask

    initial begin
        gen();
        send();
    end
endmodule
