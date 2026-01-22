module ones_counter(
                    input clk,
                    input reset,
                    input data,
                    output reg [3:0] count
                   );

    always @(posedge clk)
    begin
        if (!reset)
            count <= 0;
        else if (count == 15)
            count <= 4'b0;
        else if (data == 1)
            count <= count + 4'b1;
    end
endmodule
