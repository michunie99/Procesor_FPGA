`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 20:51:07
// Design Name: 
// Module Name: jump_cond
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


module jump_cond(
    input [7:0]cmp_res,
    input [1:0]pc_op,
    output jump_cond
    );
    
    assign jump_cond =  (pc_op == 2'b11)?1'b0:
                     (pc_op == 2'b01 & cmp_res[0])?1'b0:
                     (pc_op == 2'b10 & ~cmp_res[0])?1'b0:
                                                  1'b1;
    
endmodule
