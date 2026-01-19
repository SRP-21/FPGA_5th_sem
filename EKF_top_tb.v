`timescale 1ns/1ps

module EKF_top_tb;

    // ---------------- Inputs ----------------
    reg signed [15:0] rXp0,rXp1,rXp2,rXp3,rXp4,rXp5;
    reg signed [15:0] iXp0,iXp1,iXp2,iXp3,iXp4,iXp5;

    reg signed [15:0] rz1,rz2,rz3;
    reg signed [15:0] iz1,iz2,iz3;

    reg signed [15:0] rR1,rR2,rR3;
    reg signed [15:0] iR1,iR2,iR3;

    reg signed [15:0]
        rP0,rP1,rP2,rP3,rP4,rP5,
        rP6,rP7,rP8,rP9,rP10,rP11,
        rP12,rP13,rP14,rP15,rP16,rP17,
        rP18,rP19,rP20,rP21,rP22,rP23,
        rP24,rP25,rP26,rP27,rP28,rP29,
        rP30,rP31,rP32,rP33,rP34,rP35;

    reg signed [15:0]
        iP0,iP1,iP2,iP3,iP4,iP5,
        iP6,iP7,iP8,iP9,iP10,iP11,
        iP12,iP13,iP14,iP15,iP16,iP17,
        iP18,iP19,iP20,iP21,iP22,iP23,
        iP24,iP25,iP26,iP27,iP28,iP29,
        iP30,iP31,iP32,iP33,iP34,iP35;

    // ---------------- Outputs ----------------
    wire signed [31:0] Xf0,Xf1,Xf2,Xf3,Xf4,Xf5;
    wire signed [31:0] Pf0,Pf1,Pf2,Pf3,Pf4,Pf5;

    // ---------------- DUT ----------------
    EKF_top dut (
        rXp0,rXp1,rXp2,rXp3,rXp4,rXp5,
        iXp0,iXp1,iXp2,iXp3,iXp4,iXp5,

        rz1,rz2,rz3,
        iz1,iz2,iz3,

        rR1,rR2,rR3,
        iR1,iR2,iR3,

        rP0,rP1,rP2,rP3,rP4,rP5,
        rP6,rP7,rP8,rP9,rP10,rP11,
        rP12,rP13,rP14,rP15,rP16,rP17,
        rP18,rP19,rP20,rP21,rP22,rP23,
        rP24,rP25,rP26,rP27,rP28,rP29,
        rP30,rP31,rP32,rP33,rP34,rP35,

        iP0,iP1,iP2,iP3,iP4,iP5,
        iP6,iP7,iP8,iP9,iP10,iP11,
        iP12,iP13,iP14,iP15,iP16,iP17,
        iP18,iP19,iP20,iP21,iP22,iP23,
        iP24,iP25,iP26,iP27,iP28,iP29,
        iP30,iP31,iP32,iP33,iP34,iP35,

        Xf0,Xf1,Xf2,Xf3,Xf4,Xf5,
        Pf0,Pf1,Pf2,Pf3,Pf4,Pf5
    );

    // ---------------- Stimulus ----------------
    initial begin
        // ---- Initialize everything ----
        rXp0=0; rXp1=0; rXp2=0; rXp3=0; rXp4=0; rXp5=0;
        iXp0=0; iXp1=0; iXp2=0; iXp3=0; iXp4=0; iXp5=0;

        rz1=0; rz2=0; rz3=0;
        iz1=0; iz2=0; iz3=0;

        rR1=10; rR2=10; rR3=10;
        iR1=12; iR2=12; iR3=12;

        // ---- Fully define covariance matrices (NO X) ----
        rP0=40;  rP1=0;  rP2=0;  rP3=0;  rP4=0;  rP5=0;
        rP6=0;   rP7=40; rP8=0;  rP9=0;  rP10=0; rP11=0;
        rP12=0;  rP13=0; rP14=40; rP15=0; rP16=0; rP17=0;
        rP18=0;  rP19=0; rP20=0; rP21=40; rP22=0; rP23=0;
        rP24=0;  rP25=0; rP26=0; rP27=0; rP28=40; rP29=0;
        rP30=0;  rP31=0; rP32=0; rP33=0; rP34=0; rP35=40;

        iP0=60;  iP1=0;  iP2=0;  iP3=0;  iP4=0;  iP5=0;
        iP6=0;   iP7=60; iP8=0;  iP9=0;  iP10=0; iP11=0;
        iP12=0;  iP13=0; iP14=60; iP15=0; iP16=0; iP17=0;
        iP18=0;  iP19=0; iP20=0; iP21=60; iP22=0; iP23=0;
        iP24=0;  iP25=0; iP26=0; iP27=0; iP28=60; iP29=0;
        iP30=0;  iP31=0; iP32=0; iP33=0; iP34=0; iP35=60;

        #10;

        // ---- Apply states ----
        rXp0=100; rXp1=110; rXp2=120; rXp3=130; rXp4=140; rXp5=150;
        iXp0=90;  iXp1=100; iXp2=110; iXp3=120; iXp4=130; iXp5=140;

        // ---- Apply measurements ----
        rz1=105; rz2=115; rz3=125;
        iz1=95;  iz2=105; iz3=115;

        #100;
        $finish;
    end

endmodule
