module Fusion_unit (
    /* Diagonal covariance elements only (6×6 matrix) */
    /* P(0,0), P(1,1), P(2,2), P(3,3), P(4,4), P(5,5) */
    input  signed [15:0] P1_0,  P1_7,  P1_14, P1_21, P1_28, P1_35,
    input  signed [15:0] P2_0,  P2_7,  P2_14, P2_21, P2_28, P2_35,

    /* State estimates from sensor 1 and sensor 2 */
    input  signed [15:0] X1_0, X1_1, X1_2, X1_3, X1_4, X1_5,
    input  signed [15:0] X2_0, X2_1, X2_2, X2_3, X2_4, X2_5,

    /* Fused outputs */
    output signed [15:0] X0f, X1f, X2f, X3f, X4f, X5f,
    output signed [31:0] Pf1, Pf2, Pf3, Pf4, Pf5, Pf6
);

    /* Reciprocal of (P1 + P2), Q15 format */
    wire signed [15:0] inv0, inv1, inv2, inv3, inv4, inv5;

    NR_div_w d0 (P1_0  + P2_0 ,  inv0);
    NR_div_w d1 (P1_7  + P2_7 ,  inv1);
    NR_div_w d2 (P1_14 + P2_14, inv2);
    NR_div_w d3 (P1_21 + P2_21, inv3);
    NR_div_w d4 (P1_28 + P2_28, inv4);
    NR_div_w d5 (P1_35 + P2_35, inv5);

    /* Numerators for weighted state fusion */
    wire signed [31:0] num0 = P2_0  * X1_0 + P1_0  * X2_0;
    wire signed [31:0] num1 = P2_7  * X1_1 + P1_7  * X2_1;
    wire signed [31:0] num2 = P2_14 * X1_2 + P1_14 * X2_2;
    wire signed [31:0] num3 = P2_21 * X1_3 + P1_21 * X2_3;
    wire signed [31:0] num4 = P2_28 * X1_4 + P1_28 * X2_4;
    wire signed [31:0] num5 = P2_35 * X1_5 + P1_35 * X2_5;

    /* Fused state estimates */
    assign X0f = (num0 * inv0) >>> 15;
    assign X1f = (num1 * inv1) >>> 15;
    assign X2f = (num2 * inv2) >>> 15;
    assign X3f = (num3 * inv3) >>> 15;
    assign X4f = (num4 * inv4) >>> 15;
    assign X5f = (num5 * inv5) >>> 15;

    /* Fused covariance (diagonal only) */
    assign Pf1 = (P1_0  * P2_0  * inv0) >>> 15;
    assign Pf2 = (P1_7  * P2_7  * inv1) >>> 15;
    assign Pf3 = (P1_14 * P2_14 * inv2) >>> 15;
    assign Pf4 = (P1_21 * P2_21 * inv3) >>> 15;
    assign Pf5 = (P1_28 * P2_28 * inv4) >>> 15;
    assign Pf6 = (P1_35 * P2_35 * inv5) >>> 15;

endmodule
