`timescale 1ns/1ps

module state_prediction_tb;

reg signed [15:0] X0,X1,X2,X3,X4,X5;
reg signed [15:0]
P0,P1,P2,P3,P4,P5,
P6,P7,P8,P9,P10,P11,
P12,P13,P14,P15,P16,P17,
P18,P19,P20,P21,P22,P23,
P24,P25,P26,P27,P28,P29,
P30,P31,P32,P33,P34,P35;

wire signed [31:0] Xn0,Xn1,Xn2,Xn3,Xn4,Xn5;
wire signed [31:0]
Pn0,Pn1,Pn2,Pn3,Pn4,Pn5,
Pn6,Pn7,Pn8,Pn9,Pn10,Pn11,
Pn12,Pn13,Pn14,Pn15,Pn16,Pn17,
Pn18,Pn19,Pn20,Pn21,Pn22,Pn23,
Pn24,Pn25,Pn26,Pn27,Pn28,Pn29,
Pn30,Pn31,Pn32,Pn33,Pn34,Pn35;

state_predictor dut (
.X0(X0),.X1(X1),.X2(X2),.X3(X3),.X4(X4),.X5(X5),
.P0(P0),.P1(P1),.P2(P2),.P3(P3),.P4(P4),.P5(P5),
.P6(P6),.P7(P7),.P8(P8),.P9(P9),.P10(P10),.P11(P11),
.P12(P12),.P13(P13),.P14(P14),.P15(P15),.P16(P16),.P17(P17),
.P18(P18),.P19(P19),.P20(P20),.P21(P21),.P22(P22),.P23(P23),
.P24(P24),.P25(P25),.P26(P26),.P27(P27),.P28(P28),.P29(P29),
.P30(P30),.P31(P31),.P32(P32),.P33(P33),.P34(P34),.P35(P35),
.Xn0(Xn0),.Xn1(Xn1),.Xn2(Xn2),.Xn3(Xn3),.Xn4(Xn4),.Xn5(Xn5),
.Pn0(Pn0),.Pn1(Pn1),.Pn2(Pn2),.Pn3(Pn3),.Pn4(Pn4),.Pn5(Pn5),
.Pn6(Pn6),.Pn7(Pn7),.Pn8(Pn8),.Pn9(Pn9),.Pn10(Pn10),.Pn11(Pn11),
.Pn12(Pn12),.Pn13(Pn13),.Pn14(Pn14),.Pn15(Pn15),
.Pn16(Pn16),.Pn17(Pn17),.Pn18(Pn18),.Pn19(Pn19),
.Pn20(Pn20),.Pn21(Pn21),.Pn22(Pn22),.Pn23(Pn23),
.Pn24(Pn24),.Pn25(Pn25),.Pn26(Pn26),.Pn27(Pn27),
.Pn28(Pn28),.Pn29(Pn29),.Pn30(Pn30),.Pn31(Pn31),
.Pn32(Pn32),.Pn33(Pn33),.Pn34(Pn34),.Pn35(Pn35)
);

initial begin
X0=0; X1=0; X2=0; X3=0; X4=0; X5=0;
P0=0; P1=0; P2=0; P3=0; P4=0; P5=0;
P6=0; P7=0; P8=0; P9=0; P10=0; P11=0;
P12=0; P13=0; P14=0; P15=0; P16=0; P17=0;
P18=0; P19=0; P20=0; P21=0; P22=0; P23=0;
P24=0; P25=0; P26=0; P27=0; P28=0; P29=0;
P30=0; P31=0; P32=0; P33=0; P34=0; P35=0;

#5
X0=16'sd28; X1=16'sd30; X2=16'sd32;
X3=16'sd34; X4=16'sd36; X5=16'sd38;

#10
P0=16'sd10;  P1=16'sd12;  P2=16'sd14;  P3=16'sd16;
P4=16'sd18;  P5=16'sd20;  P6=16'sd22;  P7=16'sd24;
P8=16'sd26;  P9=16'sd28;  P10=16'sd30; P11=16'sd32;
P12=16'sd34; P13=16'sd36; P14=16'sd38; P15=16'sd40;
P16=16'sd42; P17=16'sd44; P18=16'sd46; P19=16'sd48;
P20=16'sd50; P21=16'sd52; P22=16'sd54; P23=16'sd56;
P24=16'sd58; P25=16'sd60; P26=16'sd62; P27=16'sd64;
P28=16'sd66; P29=16'sd68; P30=16'sd70; P31=16'sd72;
P32=16'sd74; P33=16'sd76; P34=16'sd78; P35=16'sd80;

#50 $finish;
end

endmodule
