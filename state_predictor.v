module state_predictor (
    input  signed [15:0] X0, X1, X2, X3, X4, X5,

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

    // ---------- Parameters ----------
    localparam signed [31:0] Qpos = 32'sd1;
    localparam signed [31:0] Qvel = 32'sd10;

    // ---------- State prediction (F·X) ----------
    assign Xn0 = X0 + X3;
    assign Xn1 = X1 + X4;
    assign Xn2 = X2 + X5;
    assign Xn3 = X3;
    assign Xn4 = X4;
    assign Xn5 = X5;

    // ---------- Diagonal covariance prediction (FPFᵀ + Q) ----------
    assign Pn0  = P0  + (P3 <<< 1)  + P21 + Qpos;
    assign Pn7  = P7  + (P10 <<< 1) + P28 + Qpos;
    assign Pn14 = P14 + (P17 <<< 1) + P35 + Qpos;

    assign Pn21 = P21 + Qvel;
    assign Pn28 = P28 + Qvel;
    assign Pn35 = P35 + Qvel;

    // ---------- Pass-through (non-diagonal terms) ----------
    assign Pn1=P1;   assign Pn2=P2;   assign Pn3=P3;   assign Pn4=P4;   assign Pn5=P5;
    assign Pn6=P6;   assign Pn8=P8;   assign Pn9=P9;   assign Pn10=P10; assign Pn11=P11;
    assign Pn12=P12; assign Pn13=P13; assign Pn15=P15; assign Pn16=P16; assign Pn17=P17;
    assign Pn18=P18; assign Pn19=P19; assign Pn20=P20; assign Pn22=P22; assign Pn23=P23;
    assign Pn24=P24; assign Pn25=P25; assign Pn26=P26; assign Pn27=P27; assign Pn29=P29;
    assign Pn30=P30; assign Pn31=P31; assign Pn32=P32; assign Pn33=P33; assign Pn34=P34;

endmodule
