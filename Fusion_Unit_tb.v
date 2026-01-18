`timescale 1ns/1ps

module Fusion_unit_tb;

    /* Diagonal covariance inputs */
    reg signed [15:0] P1_0,  P1_7,  P1_14, P1_21, P1_28, P1_35;
    reg signed [15:0] P2_0,  P2_7,  P2_14, P2_21, P2_28, P2_35;

    /* State estimates */
    reg signed [15:0] X1_0, X1_1, X1_2, X1_3, X1_4, X1_5;
    reg signed [15:0] X2_0, X2_1, X2_2, X2_3, X2_4, X2_5;

    /* Outputs */
    wire signed [15:0] X0f, X1f, X2f, X3f, X4f, X5f;
    wire signed [31:0] Pf1, Pf2, Pf3, Pf4, Pf5, Pf6;

    /* DUT */
    Fusion_unit dut (
        .P1_0(P1_0),   .P2_0(P2_0),
        .P1_7(P1_7),   .P2_7(P2_7),
        .P1_14(P1_14), .P2_14(P2_14),
        .P1_21(P1_21), .P2_21(P2_21),
        .P1_28(P1_28), .P2_28(P2_28),
        .P1_35(P1_35), .P2_35(P2_35),

        .X1_0(X1_0), .X2_0(X2_0),
        .X1_1(X1_1), .X2_1(X2_1),
        .X1_2(X1_2), .X2_2(X2_2),
        .X1_3(X1_3), .X2_3(X2_3),
        .X1_4(X1_4), .X2_4(X2_4),
        .X1_5(X1_5), .X2_5(X2_5),

        .X0f(X0f), .X1f(X1f), .X2f(X2f),
        .X3f(X3f), .X4f(X4f), .X5f(X5f),

        .Pf1(Pf1), .Pf2(Pf2), .Pf3(Pf3),
        .Pf4(Pf4), .Pf5(Pf5), .Pf6(Pf6)
    );

    initial begin
        /* Initialize */
        P1_0=0;  P1_7=0;  P1_14=0; P1_21=0; P1_28=0; P1_35=0;
        P2_0=0;  P2_7=0;  P2_14=0; P2_21=0; P2_28=0; P2_35=0;

        X1_0=0; X1_1=0; X1_2=0; X1_3=0; X1_4=0; X1_5=0;
        X2_0=0; X2_1=0; X2_2=0; X2_3=0; X2_4=0; X2_5=0;

        #10;

        /* Diagonal covariances */
        P1_0  = 20;  P2_0  = 10;
        P1_7  = 30;  P2_7  = 15;
        P1_14 = 40;  P2_14 = 20;
        P1_21 = 50;  P2_21 = 25;
        P1_28 = 60;  P2_28 = 30;
        P1_35 = 70;  P2_35 = 35;

        /* States */
        X1_0 = 100;  X2_0 = 80;
        X1_1 = 110;  X2_1 = 90;
        X1_2 = 120;  X2_2 = 100;
        X1_3 = 130;  X2_3 = 110;
        X1_4 = 140;  X2_4 = 120;
        X1_5 = 150;  X2_5 = 130;

        #100;
        $finish;
    end

endmodule
