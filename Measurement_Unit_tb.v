`timescale 1ns / 1ps

module Measurement_Unit_tb;

    // ---------------- Inputs ----------------
    reg signed [15:0] X0, X1, X2, X3, X4, X5;
    reg signed [15:0] z1, z2, z3;
    reg signed [15:0] R1, R2, R3;

    reg signed [15:0]
        P0,  P1,  P2,  P3,  P4,  P5,
        P6,  P7,  P8,  P9,  P10, P11,
        P12, P13, P14, P15, P16, P17,
        P18, P19, P20, P21, P22, P23,
        P24, P25, P26, P27, P28, P29,
        P30, P31, P32, P33, P34, P35;

    // ---------------- Outputs ----------------
    wire signed [31:0] Xn0, Xn1, Xn2, Xn3, Xn4, Xn5;

    wire signed [31:0]
        Pn0,  Pn1,  Pn2,  Pn3,  Pn4,  Pn5,
        Pn6,  Pn7,  Pn8,  Pn9,  Pn10, Pn11,
        Pn12, Pn13, Pn14, Pn15, Pn16, Pn17,
        Pn18, Pn19, Pn20, Pn21, Pn22, Pn23,
        Pn24, Pn25, Pn26, Pn27, Pn28, Pn29,
        Pn30, Pn31, Pn32, Pn33, Pn34, Pn35;

    // ---------------- DUT ----------------
    Measurement_Unit dut (
        .X0(X0), .X1(X1), .X2(X2), .X3(X3), .X4(X4), .X5(X5),
        .z1(z1), .z2(z2), .z3(z3),
        .R1(R1), .R2(R2), .R3(R3),

        .P0(P0),   .P1(P1),   .P2(P2),   .P3(P3),   .P4(P4),   .P5(P5),
        .P6(P6),   .P7(P7),   .P8(P8),   .P9(P9),   .P10(P10), .P11(P11),
        .P12(P12), .P13(P13), .P14(P14), .P15(P15), .P16(P16), .P17(P17),
        .P18(P18), .P19(P19), .P20(P20), .P21(P21), .P22(P22), .P23(P23),
        .P24(P24), .P25(P25), .P26(P26), .P27(P27), .P28(P28), .P29(P29),
        .P30(P30), .P31(P31), .P32(P32), .P33(P33), .P34(P34), .P35(P35),

        .Xn0(Xn0), .Xn1(Xn1), .Xn2(Xn2),
        .Xn3(Xn3), .Xn4(Xn4), .Xn5(Xn5),

        .Pn0(Pn0),   .Pn1(Pn1),   .Pn2(Pn2),   .Pn3(Pn3),   .Pn4(Pn4),   .Pn5(Pn5),
        .Pn6(Pn6),   .Pn7(Pn7),   .Pn8(Pn8),   .Pn9(Pn9),   .Pn10(Pn10), .Pn11(Pn11),
        .Pn12(Pn12), .Pn13(Pn13), .Pn14(Pn14), .Pn15(Pn15), .Pn16(Pn16), .Pn17(Pn17),
        .Pn18(Pn18), .Pn19(Pn19), .Pn20(Pn20), .Pn21(Pn21), .Pn22(Pn22), .Pn23(Pn23),
        .Pn24(Pn24), .Pn25(Pn25), .Pn26(Pn26), .Pn27(Pn27), .Pn28(Pn28), .Pn29(Pn29),
        .Pn30(Pn30), .Pn31(Pn31), .Pn32(Pn32), .Pn33(Pn33), .Pn34(Pn34), .Pn35(Pn35)
    );

    // ---------------- Stimulus ----------------
    initial begin
        // Clear all
        X0=0; X1=0; X2=0; X3=0; X4=0; X5=0;
        z1=0; z2=0; z3=0;
        R1=0; R2=0; R3=0;

        P0=0;  P1=0;  P2=0;  P3=0;  P4=0;  P5=0;
        P6=0;  P7=0;  P8=0;  P9=0;  P10=0; P11=0;
        P12=0; P13=0; P14=0; P15=0; P16=0; P17=0;
        P18=0; P19=0; P20=0; P21=0; P22=0; P23=0;
        P24=0; P25=0; P26=0; P27=0; P28=0; P29=0;
        P30=0; P31=0; P32=0; P33=0; P34=0; P35=0;

        #10;

        // Predicted states
        X0 = 100;
        X1 = 110;
        X2 = 120;
        X3 = 130;
        X4 = 140;
        X5 = 150;

        // Measurements
        z1 = 105;
        z2 = 108;
        z3 = 118;

        // Measurement noise
        R1 = 10;
        R2 = 15;
        R3 = 20;

        // Predicted covariances (diagonal terms only matter here)
        P0  = 20;
        P7  = 30;
        P14 = 40;

        // Other covariance entries (pass-through)
        P1=1; P2=2; P3=3; P4=4; P5=5;
        P6=6; P8=8; P9=9; P10=10; P11=11;
        P12=12; P13=13; P15=15; P16=16; P17=17;
        P18=18; P19=19; P20=20; P21=21; P22=22; P23=23;
        P24=24; P25=25; P26=26; P27=27; P28=28; P29=29;
        P30=30; P31=31; P32=32; P33=33; P34=34; P35=35;

        #100;
        $finish;
    end

endmodule
