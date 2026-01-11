module always_comb_design(
    input wire clock, 
    input wire resetn
);

    enum {WAIT, LOAD, STORE} state, next_state;
    always @(posedge clock or negedge resetn)
        if (!resetn) state <= WAIT;
        else state <= next_state;

    always_comb
        case (state)
            WAIT: next_state = LOAD;
            LOAD: next_state = STORE;
            STORE: next_state = WAIT;
        endcase
endmodule

module always_comb_tb;
    reg clock, resetn;
    always_comb_design ctrl(clock, resetn);

    initial begin
        #8 resetn = 0;
        #8 resetn = 1;
        #8 resetn = 0;
    end

    initial begin
        clock = 1;
        forever #5 clock = ~clock;
    end

    initial
        $monitor("Time: %g, Clock: %b, Reset: %b, State: %0d, Next State: %0d", $time, clock, resetn, ctrl.state, ctrl.next_state);

    initial 
        #50 $finish;
endmodule
