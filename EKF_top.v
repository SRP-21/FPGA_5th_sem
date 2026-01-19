module EKF_top (
    input signed [15:0] rXp0,rXp1,rXp2,rXp3,rXp4,rXp5,
    input signed [15:0] iXp0,iXp1,iXp2,iXp3,iXp4,iXp5,

    input signed [15:0] rz1,rz2,rz3,
    input signed [15:0] iz1,iz2,iz3,

    input signed [15:0] rR1,rR2,rR3,
    input signed [15:0] iR1,iR2,iR3,

    input signed [15:0]
        rP0,rP1,rP2,rP3,rP4,rP5,
        rP6,rP7,rP8,rP9,rP10,rP11,
        rP12,rP13,rP14,rP15,rP16,rP17,
        rP18,rP19,rP20,rP21,rP22,rP23,
        rP24,rP25,rP26,rP27,rP28,rP29,
        rP30,rP31,rP32,rP33,rP34,rP35,

    input signed [15:0]
        iP0,iP1,iP2,iP3,iP4,iP5,
        iP6,iP7,iP8,iP9,iP10,iP11,
        iP12,iP13,iP14,iP15,iP16,iP17,
        iP18,iP19,iP20,iP21,iP22,iP23,
        iP24,iP25,iP26,iP27,iP28,iP29,
        iP30,iP31,iP32,iP33,iP34,iP35,

    output signed [31:0] Xf0,Xf1,Xf2,Xf3,Xf4,Xf5,
    output signed [31:0] Pf0,Pf1,Pf2,Pf3,Pf4,Pf5
);

    /* ---------- Measurement outputs ---------- */
    wire signed [31:0] rXn0,rXn1,rXn2,rXn3,rXn4,rXn5;
    wire signed [31:0] iXn0,iXn1,iXn2,iXn3,iXn4,iXn5;

    wire signed [31:0] rPn0,rPn7,rPn14,rPn21,rPn28,rPn35;
    wire signed [31:0] iPn0,iPn7,iPn14,iPn21,iPn28,iPn35;

    Measurement_unit mu_rad (
        rXp0,rXp1,rXp2,rXp3,rXp4,rXp5,
        rz1,rz2,rz3,
        rR1,rR2,rR3,
        rP0,rP1,rP2,rP3,rP4,rP5,
        rP6,rP7,rP8,rP9,rP10,rP11,
        rP12,rP13,rP14,rP15,rP16,rP17,
        rP18,rP19,rP20,rP21,rP22,rP23,
        rP24,rP25,rP26,rP27,rP28,rP29,
        rP30,rP31,rP32,rP33,rP34,rP35,
        rXn0,rXn1,rXn2,rXn3,rXn4,rXn5,
        rPn0,, , , , ,
        ,rPn7, , , , ,
        , ,rPn14, , , ,
        , , ,rPn21, , ,
        , , , ,rPn28, ,
        , , , , ,rPn35
    );

    Measurement_unit mu_ir (
        iXp0,iXp1,iXp2,iXp3,iXp4,iXp5,
        iz1,iz2,iz3,
        iR1,iR2,iR3,
        iP0,iP1,iP2,iP3,iP4,iP5,
        iP6,iP7,iP8,iP9,iP10,iP11,
        iP12,iP13,iP14,iP15,iP16,iP17,
        iP18,iP19,iP20,iP21,iP22,iP23,
        iP24,iP25,iP26,iP27,iP28,iP29,
        iP30,iP31,iP32,iP33,iP34,iP35,
        iXn0,iXn1,iXn2,iXn3,iXn4,iXn5,
        iPn0,, , , , ,
        ,iPn7, , , , ,
        , ,iPn14, , , ,
        , , ,iPn21, , ,
        , , , ,iPn28, ,
        , , , , ,iPn35
    );

    /* ---------- Fusion ---------- */
    wire signed [15:0] Xf0_16,Xf1_16,Xf2_16,Xf3_16,Xf4_16,Xf5_16;

    Fusion_unit fus (
        rPn0[15:0], rPn7[15:0], rPn14[15:0], rPn21[15:0], rPn28[15:0], rPn35[15:0],
        iPn0[15:0], iPn7[15:0], iPn14[15:0], iPn21[15:0], iPn28[15:0], iPn35[15:0],
        rXn0[15:0], rXn1[15:0], rXn2[15:0], rXn3[15:0], rXn4[15:0], rXn5[15:0],
        iXn0[15:0], iXn1[15:0], iXn2[15:0], iXn3[15:0], iXn4[15:0], iXn5[15:0],
        Xf0_16,Xf1_16,Xf2_16,Xf3_16,Xf4_16,Xf5_16,
        Pf0,Pf1,Pf2,Pf3,Pf4,Pf5
    );

    /* ---------- Sign extension (FIXES Z) ---------- */
    assign Xf0 = {{16{Xf0_16[15]}}, Xf0_16};
    assign Xf1 = {{16{Xf1_16[15]}}, Xf1_16};
    assign Xf2 = {{16{Xf2_16[15]}}, Xf2_16};
    assign Xf3 = {{16{Xf3_16[15]}}, Xf3_16};
    assign Xf4 = {{16{Xf4_16[15]}}, Xf4_16};
    assign Xf5 = {{16{Xf5_16[15]}}, Xf5_16};

endmodule
