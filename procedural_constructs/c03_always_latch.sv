module always_latch_ex(
                        input clk,
                        input ready,
                        input resetn,
                        output logic [4:0] read_pointer
                      );
    logic enable, overflow;
    always_latch begin
        if (!resetn) enable <= 0;
        else if (ready) enable <= 1;
        else if (overflow) enable <= 0;
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn) {overflow, read_pointer} <= 0;
        else if (enable) {overflow, read_pointer} <= read_pointer + 1;
    end
endmodule

module always_latch_tb;
    reg clk = 0, ready, resetn;
    wire [4:0] read_pointer;
    always_latch_ex dsn(clk, ready, resetn, read_pointer);

    always
        #5 clk = ~clk;

    initial begin
        resetn = 0;
        #10 resetn = 1;
        #10 ready = 1;
    end

    initial begin
        $monitor("Time: %g, Overflow: %b, Read Pointer: %b", $time, dsn.overflow, read_pointer);
        #300 $finish;
    end
endmodule
