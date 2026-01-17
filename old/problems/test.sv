module always_comb_latch_error;

  logic a, sel;
  logic y;

  always_comb begin
    if (sel)
      y = a;
    // missing else -> latch attempt
  end

  initial begin
    a = 1;
    sel = 0;
    #10 sel = 1;
    #10 $finish;
  end

endmodule
