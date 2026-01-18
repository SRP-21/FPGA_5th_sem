module Measurement_Unit(
    input  signed [15:0] X0, X1, X2, X3, X4, X5,
    input  signed [15:0] z1, z2, z3,
    input  signed [15:0] R1, R2, R3,

    input  signed [15:0]
        P0,  P1,  P2,  P3,  P4,  P5,
        P6,  P7,  P8,  P9,  P10, P11,
        P12, P13, P14, P15, P16, P17,
        P18, P19, P20, P21, P22, P23,
        P24, P25, P26, P27, P28, P29,
        P30, P31, P32, P33, P34, P35,

    output signed [31:0] Xn0, Xn1, Xn2, Xn3, Xn4, Xn5,

    output signed [31:0]
        Pn0,  Pn1,  Pn2,  Pn3,  Pn4,  Pn5,
        Pn6,  Pn7,  Pn8,  Pn9,  Pn10, Pn11,
        Pn12, Pn13, Pn14, Pn15, Pn16, Pn17,
        Pn18, Pn19, Pn20, Pn21, Pn22, Pn23,
        Pn24, Pn25, Pn26, Pn27, Pn28, Pn29,
        Pn30, Pn31, Pn32, Pn33, Pn34, Pn35
);

    /* ---------- Innovations ---------- */
    wire signed [15:0] y1 = z1 - X0;
    wire signed [15:0] y2 = z2 - X1;
    wire signed [15:0] y3 = z3 - X2;

    /* ---------- Reciprocal (NR) ---------- */
    wire signed [15:0] inv1, inv2, inv3;

    NR_div_w d1 (P0  + R1, inv1);
    NR_div_w d2 (P7  + R2, inv2);
    NR_div_w d3 (P14 + R3, inv3);

    /* ---------- Kalman gains (Q15) ---------- */
    wire signed [31:0] K1 = P0  * inv1;
    wire signed [31:0] K2 = P7  * inv2;
    wire signed [31:0] K3 = P14 * inv3;

    /* ---------- State updates ---------- */
    assign Xn0 = X0 + ((K1 * y1) >>> 15);
    assign Xn1 = X1 + ((K2 * y2) >>> 15);
    assign Xn2 = X2 + ((K3 * y3) >>> 15);
    assign Xn3 = X3;
    assign Xn4 = X4;
    assign Xn5 = X5;

    /* ---------- Covariance updates ---------- */
    wire signed [31:0] one_minus_K1 = 32'sh00008000 - K1;
    wire signed [31:0] one_minus_K2 = 32'sh00008000 - K2;
    wire signed [31:0] one_minus_K3 = 32'sh00008000 - K3;

    assign Pn0  = (one_minus_K1 * P0)  >>> 15;
    assign Pn7  = (one_minus_K2 * P7)  >>> 15;
    assign Pn14 = (one_minus_K3 * P14) >>> 15;

    /* ---------- Unaffected covariances ---------- */
    assign Pn1=P1;   assign Pn2=P2;   assign Pn3=P3;   assign Pn4=P4;   assign Pn5=P5;
    assign Pn6=P6;   assign Pn8=P8;   assign Pn9=P9;   assign Pn10=P10; assign Pn11=P11;
    assign Pn12=P12; assign Pn13=P13; assign Pn15=P15; assign Pn16=P16; assign Pn17=P17;
    assign Pn18=P18; assign Pn19=P19; assign Pn20=P20; assign Pn21=P21; assign Pn22=P22;
    assign Pn23=P23; assign Pn24=P24; assign Pn25=P25; assign Pn26=P26; assign Pn27=P27;
    assign Pn28=P28; assign Pn29=P29; assign Pn30=P30; assign Pn31=P31; assign Pn32=P32;
    assign Pn33=P33; assign Pn34=P34; assign Pn35=P35;

endmodule
