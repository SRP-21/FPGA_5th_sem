module NR_div_w (
    input  signed [15:0] D_in,   // Integer denominator
    output reg signed [15:0] Q    // Reciprocal in Q15 format
);

    integer i;
    reg signed [31:0] D;      // Normalized denominator (Q15)
    reg signed [31:0] x;      // Reciprocal estimate (Q30)
    reg signed [47:0] Dx;
    reg signed [31:0] term;
    reg signed [63:0] mult;
    reg [4:0] shift;

    always @(*) begin
        /* Convert integer denominator to Q15 */
        D = D_in <<< 15;

        /* Normalize D to range [0.5, 1) */
        shift = 0;
        while (D > 32'sh00008000) begin
            D     = D >>> 1;
            shift = shift + 1;
        end

        /* Initial reciprocal estimate */
        x = 32'sh40000000; // 0.5 in Q30

        /* Newton-Raphson iterations */
        for (i = 0; i < 4; i = i + 1) begin
            Dx   = D * x;                     // Q45
            term = 32'sh80000000 - (Dx >>> 15); // (2 - D*x) in Q30
            mult = x * term;                  // Q60
            x    = mult >>> 30;               // Back to Q30
        end

        /* De-normalization */
        x = x >>> shift;

        /* Convert Q30 to Q15 */
        Q = x >>> 15;
    end

endmodule
