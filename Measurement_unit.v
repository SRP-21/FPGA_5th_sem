`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 01:16:00
// Design Name: 
// Module Name: Measurement_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Measurement_unit(
input signed [15:0] X0, X1,X2,X3,X4,X5,
input signed [15:0] z1, z2, z3,
 input  signed [15:0]
        P0,  P1,  P2,  P3,  P4,  P5,
        P6,  P7,  P8,  P9,  P10, P11,
        P12, P13, P14, P15, P16, P17,
        P18, P19, P20, P21, P22, P23,
        P24, P25, P26, P27, P28, P29,
        P30, P31, P32, P33, P34, P35,
        
output reg signed [31:0] Xn0, Xn1,Xn2,Xn3,Xn4,Xn5,

output reg signed [31:0]
        Pn0,  Pn1,  Pn2,  Pn3,  Pn4,  Pn5,
        Pn6,  Pn7,  Pn8,  Pn9,  Pn10, Pn11,
        Pn12, Pn13, Pn14, Pn15, Pn16, Pn17,
        Pn18, Pn19, Pn20, Pn21, Pn22, Pn23,
        Pn24, Pn25, Pn26, Pn27, Pn28, Pn29,
        Pn30, Pn31, Pn32, Pn33, Pn34, Pn35       
    );
    
 wire signed [15:0] R1, R2, R3;
 wire signed [15:0] y1, y2, y3;
 wire signed [15:0] k1, k2, k3;
 wire signed [15:0] d1, d2, d3;
 
 assign y1 = z1 - X0;
 assign y2 = z2 - X1;
 assign y3 = z3 - X2;
 
 
 assign k1 = P0/(P0 + R1);
 assign k2 = P7/(P7 + R2);
 assign k3 = P14/(P14 + R3);
 
 always @(*) 
 begin
 Xn0 = X0 + k1*y1;
 Xn1 = X1 + k2*y2;
 Xn2 = X2 + k3*y3;
 Xn3 = X3;
 Xn4 = X4;
 Xn5 = X5;

 Pn0 = (1-k1)*Pn0;
 Pn1 = (1-k2)*Pn1;
 Pn2 = (1-k3)*Pn3;
Pn3 = P3;
Pn4 = P4;
Pn5 = P5;
Pn6 = P6;
Pn7 = P7;
Pn8 = P8;
Pn9 = P9;
Pn10 = P10;
Pn11 = P11;
Pn12 = P12;
Pn13 = P13;
Pn14 = P14;
Pn15 = P15;
Pn16 = P16;
Pn17 = P17;
Pn18 = P18;
Pn19 = P19;
Pn20 = P20;
Pn21 = P21;
Pn22 = P22;
Pn23 = P23;
Pn24 = P24;
Pn25 = P25;
Pn26 = P26;
Pn27 = P27;
Pn28 = P28;
Pn29 = P29;
Pn30 = P30;
Pn31 = P31;
Pn32 = P32;
Pn33 = P33;
Pn34 = P34;
Pn35 = P35;

end

endmodule
