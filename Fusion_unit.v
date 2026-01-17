module Fusion_unit (
    input  signed [15:0] P1_0,  P1_6,  P1_14, P1_21, P1_28, P1_36,
    input  signed [15:0] P2_0,  P2_6,  P2_14, P2_21, P2_28, P2_36,

    input  signed [15:0] X1_0, X1_1, X1_2, X1_3, X1_4, X1_5,
    input  signed [15:0] X2_0, X2_1, X2_2, X2_3, X2_4, X2_5,

    output signed [15:0] X0f, X1f, X2f, X3f, X4f, X5f,
    output signed [31:0] Pf1, Pf2, Pf3, Pf4, Pf5, Pf6
);

    wire signed [15:0] invt1, invt2, invt3, invt4, invt5, invt6;

    wire signed [31:0] w11, w21;
    wire signed [31:0] w12, w22;
    wire signed [31:0] w13, w23;
    wire signed [31:0] w14, w24;
    wire signed [31:0] w15, w25;
    wire signed [31:0] w16, w26;

    assign w11 = P2_0/(P1_0+P2_0);
    assign w21 = P1_0/(P1_0+P2_0);

    assign w12 = P2_6/(P1_6+P2_6);
    assign w22 = P1_6/(P1_6+P2_6);

    assign w13 = P2_14/(P1_14+P2_14);
    assign w23 = P1_14/(P1_14+P2_14);

    assign w14 = P2_21/(P1_21+P2_21);
    assign w24 = P1_21/(P1_21+P2_21);

    assign w15 = P2_28 /(P1_28+P2_28);
    assign w25 = P1_28/(P1_28+P2_28);

    assign w16 = P2_36/(P1_36+P2_36);
    assign w26 = P1_36/(P1_36+P2_36);

    assign X0f = (w11*X1_0 + w21*X2_0) >>> 15;
    assign X1f = (w12*X1_1 + w22*X2_1) >>> 15;
    assign X2f = (w13*X1_2 + w23*X2_2) >>> 15;
    assign X3f = (w14*X1_3 + w24*X2_3) >>> 15;
    assign X4f = (w15*X1_4 + w25*X2_4) >>> 15;
    assign X5f = (w16*X1_5 + w26*X2_5) >>> 15;

    assign Pf1 = P1_0 * P2_0 *invt1;
    assign Pf2 = P1_6*P2_6*invt2;
    assign Pf3 = P1_14*P2_14*invt3;
    assign Pf4 = P1_21*P2_21*invt4;
    assign Pf5 = P1_28*P2_28*invt5;
    assign Pf6 = P1_36*P2_36*invt6;

endmodule
