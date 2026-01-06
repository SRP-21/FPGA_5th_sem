`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2026 04:17:33
// Design Name: 
// Module Name: EKF_top
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


module EKF_top(
//prvious states
input signed [15:0] rXp0, rXp1,rXp2,rXp3,rXp4,rXp5,
input  signed [15:0]
        rP0,  rP1,  rP2,  rP3,  rP4,  rP5,
        rP6,  rP7,  rP8,  rP9,  rP10, rP11,
        rP12, rP13, rP14, rP15, rP16, rP17,
        rP18, rP19, rP20, rP21, rP22, rP23,
        rP24, rP25, rP26, rP27, rP28, rP29,
        rP30, rP31, rP32, rP33, rP34, rP35,

input signed [15:0] rz1,rz2,rz3,

input signed [15:0] iXp0, iXp1,iXp2,iXp3,iXp4,iXp5,
input  signed [15:0]
        iP0,  iP1,  iP2,  iP3,  iP4,  iP5,
        iP6,  iP7,  iP8,  iP9,  iP10, iP11,
        iP12, iP13, iP14, iP15, iP16, iP17,
        iP18, iP19, iP20, iP21, iP22, iP23,
        iP24, iP25, iP26, iP27, iP28, iP29,
        iP30, iP31, iP32, iP33, iP34, iP35,

input signed [15:0] iz1,iz2,iz3,

output signed [31:0] Xf0, Xf1, Xf2, Xf3, Xf4, Xf5,
output signed [31:0] Pf0, Pf1, Pf2, Pf3, Pf4, Pf5
);

wire signed [15:0] rXpred0, rXpred1, rXpred2, rPred3, rPred4, rPred5;

wire signed [31:0]  rPpred0, rPpred1, rPpred2, rPpred3, rPpred4, rPpred5,
                        rPpred6, rPpred7, rPpred8, rPpred9, rPpred10, rPpred11,
                        rPpred12, rPpred13, rPpred14, rPpred15, rPpred16, rPpred17,
                        rPpred18, rPpred19, rPpred20, rPpred21, rPpred22, rPpred23,
                        rPpred24, rPpred25, rPpred26, rPpred27, rPpred28, rPpred29,
                        rPpred30, rPpred31, rPpred32, rPpred33, rPpred34, rPpred35;
                        
wire signed [15:0] iXpred0, iXpred1, iXpred2, iXpred3, iXpred4, iXpred5;

wire signed [31:0]  iPpred0, iPpred1, iPpred2, iPpred3, iPpred4, iPpred5,
                        iPpred6, iPpred7, iPpred8, iPpred9, iPpred10, iPpred11,
                        iPpred12, iPpred13, iPpred14, iPpred15, iPpred16, iPpred17,
                        iPpred18, iPpred19, iPpred20, iPpred21, iPpred22, iPpred23,
                        iPpred24, iPpred25, iPpred26, iPpred27, iPpred28, iPpred29,
                        iPpred30, iPpred31, iPpred32, iPpred33, iPpred34, iPpred35;

wire signed [15:0] rXn0, rXn1, rXn2, rXn3, rXn4, rXn5;

wire signed [31:0]  rPn0, rPn1, rPn2, rPn3, rPn4, rPn5,
                        rPn6, rPn7, rPn8, rPn9, rPn10, rPn11,
                        rPn12, rPn13, rPn14, rPn15, rPn16, rPn17,
                        rPn18, rPn19, rPn20, rPn21, rPn22, rPn23,
                        rPn24, rPn25, rPn26, rPn27, rPn28, rPn29,
                        rPn30, rPn31, rPn32, rPn33, rPn34, rPn35;

wire signed [15:0] iXn0, iXn1, iXn2, iXn3, iXn4, iXn5;

wire signed [31:0]  iPn0, iPn1, iPn2, iPn3, iPn4, iPn5,
                        iPn6, iPn7, iPn8, iPn9, iPn10, iPn11,
                        iPn12, iPn13, iPn14, iPn15, iPn16, iPn17,
                        iPn18, iPn19, iPn20, iPn21, iPn22, iPn23,
                        iPn24, iPn25, iPn26, iPn27, iPn28, iPn29,
                        iPn30, iPn31, iPn32, iPn33, iPn34, iPn35;                        
  
                       
state_predictor sp_rad (rXp0, rXp1,rXp2,rXp3,rXp4,rXp5,
                        
                        rP0,  rP1,  rP2,  rP3,  rP4,  rP5,
                        rP6,  rP7,  rP8,  rP9,  rP10, rP11,
                        rP12, rP13, rP14, rP15, rP16, rP17,
                        rP18, rP19, rP20, rP21, rP22, rP23,
                        rP24, rP25, rP26, rP27, rP28, rP29,
                        rP30, rP31, rP32, rP33, rP34, rP35,
                        
                        rXpred0, rXpred1, rXpred2, rPred3, rPred4, rPred5,
                        
                        rPpred0, rPpred1, rPpred2, rPpred3, rPpred4, rPpred5,
                        rPpred6, rPpred7, rPpred8, rPpred9, rPpred10, rPpred11,
                        rPpred12, rPpred13, rPpred14, rPpred15, rPpred16, rPpred17,
                        rPpred18, rPpred19, rPpred20, rPpred21, rPpred22, rPpred23,
                        rPpred24, rPpred25, rPpred26, rPpred27, rPpred28, rPpred29,
                        rPpred30, rPpred31, rPpred32, rPpred33, rPpred34, rPpred35);
                        
state_predictor sp_ir (iXp0, iXp1, iXp2, iXp3, iXp4, iXp5,

                        iP0, iP1, iP2, iP3, iP4, iP5,
                        iP6, iP7, iP8, iP9, iP10, iP11,
                        iP12, iP13, iP14, iP15, iP16, iP17,
                        iP18, iP19, iP20, iP21, iP22, iP23,
                        iP24, iP25, iP26, iP27, iP28, iP29,
                        iP30, iP31, iP32, iP33, iP34, iP35,
                        
                        iXpred0, iXpred1, iXpred2, iXpred3, iXpred4, iXpred5,
                        
                        iPpred0, iPpred1, iPpred2, iPpred3, iPpred4, iPpred5,
                        iPpred6, iPpred7, iPpred8, iPpred9, iPpred10, iPpred11,
                        iPpred12, iPpred13, iPpred14, iPpred15, iPpred16, iPpred17,
                        iPpred18, iPpred19, iPpred20, iPpred21, iPpred22, iPpred23,
                        iPpred24, iPpred25, iPpred26, iPpred27, iPpred28, iPpred29,
                        iPpred30, iPpred31, iPpred32, iPpred33, iPpred34, iPpred35);
                        
Measurement_unit mu_rad (rXpred0, rXpred1, rXpred2, rPred3, rPred4, rPred5,

                        rz1,rz2,rz3,
                        
                        rPpred0, rPpred1, rPpred2, rPpred3, rPpred4, rPpred5,
                        rPpred6, rPpred7, rPpred8, rPpred9, rPpred10, rPpred11,
                        rPpred12, rPpred13, rPpred14, rPpred15, rPpred16, rPpred17,
                        rPpred18, rPpred19, rPpred20, rPpred21, rPpred22, rPpred23,
                        rPpred24, rPpred25, rPpred26, rPpred27, rPpred28, rPpred29,
                        rPpred30, rPpred31, rPpred32, rPpred33, rPpred34, rPpred35,  
                        
                        rXn0, rXn1, rXn2, rXn3, rXn4, rXn5,

                        rPn0, rPn1, rPn2, rPn3, rPn4, rPn5,
                        rPn6, rPn7, rPn8, rPn9, rPn10, rPn11,
                        rPn12, rPn13, rPn14, rPn15, rPn16, rPn17,
                        rPn18, rPn19, rPn20, rPn21, rPn22, rPn23,
                        rPn24, rPn25, rPn26, rPn27, rPn28, rPn29,
                        rPn30, rPn31, rPn32, rPn33, rPn34, rPn35);
                     
                                               
Measurement_unit mu_ir (iXpred0, iXpred1, iXpred2, iXpred3, iXpred4, iXpred5,

                        iz1, iz2, iz3,
                        
                        iPpred0, iPpred1, iPpred2, iPpred3, iPpred4, iPpred5,
                        iPpred6, iPpred7, iPpred8, iPpred9, iPpred10, iPpred11,
                        iPpred12, iPpred13, iPpred14, iPpred15, iPpred16, iPpred17,
                        iPpred18, iPpred19, iPpred20, iPpred21, iPpred22, iPpred23,
                        iPpred24, iPpred25, iPpred26, iPpred27, iPpred28, iPpred29,
                        iPpred30, iPpred31, iPpred32, iPpred33, iPpred34, iPpred35,
                        
                        iXn0, iXn1, iXn2, iXn3, iXn4, iXn5,
                        
                        iPn0, iPn1, iPn2, iPn3, iPn4, iPn5,
                        iPn6, iPn7, iPn8, iPn9, iPn10, iPn11,
                        iPn12, iPn13, iPn14, iPn15, iPn16, iPn17,
                        iPn18, iPn19, iPn20, iPn21, iPn22, iPn23,
                        iPn24, iPn25, iPn26, iPn27, iPn28, iPn29,
                        iPn30, iPn31, iPn32, iPn33, iPn34, iPn35);
                        
Fusion_unit fus1 (rPn0, rPn7, rPn14, rPn21, rPn28, rPn35,

                iPn0, iPn7, iPn14, iPn21, iPn28, iPn35,
                
                rXn0, rXn1, rXn2, rXn3, rXn4, rXn5,
                
                iXn0, iXn1, iXn2, iXn3, iXn4, iXn5,
                
                Xf0, Xf1, Xf2, Xf3, Xf4, Xf5,
                
                Pf0, Pf1, Pf2, Pf3, Pf4, Pf5);
                
                                             
endmodule
