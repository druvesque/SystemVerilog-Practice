module and_vector (
  input  logic [7:0] a,
  input  logic [7:0] b,
  output logic [7:0] y
);

  always_comb begin
    for (int i = 0; i < 8; i++) begin
      y[i] = a[i] & b[i];
    end
  end

endmodule

