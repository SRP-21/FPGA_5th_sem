module NR_div_w (
    input  signed [15:0] D,
    output reg signed [15:0] Q
);
    always @(*) begin
        if (D != 0)
            Q = 16'sd32767 / D;   
        else
            Q = 16'sd0;
    end
endmodule
