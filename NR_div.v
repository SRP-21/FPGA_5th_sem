`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 00:25:05
// Design Name: 
// Module Name: NR_div
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


module NR_div_w (
    input  signed [15:0] D,  
    input signed [15:0] w,  
    output reg signed [31:0] Q  
    
);

    integer i;

    reg signed [31:0] x;        
    reg signed [47:0] Dx;
    reg signed [31:0] term;
    reg signed [63:0] mult;

    always @(*) begin
       
        x = 32'sh40000000;

     
        for (i = 0; i < 3; i = i + 1) begin
            Dx   = D * x;                    
            term = 32'sh80000000 - (Dx >>> 14); 
            mult = x * term;
            x    = mult >>> 30;
        end

        Q = w*x;
    end

endmodule

