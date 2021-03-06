`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2021 14:36:24
// Design Name: 
// Module Name: multiplexer
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


module multiplexer(//8 port, 8 bit multiplexer, for smaller port count conect only first fev outputs
    input [63:0] idata,
    input [2:0] select,
    output [7:0] odata
    );
    
     wire [7:0] array [7:0];
     assign {array[7],array[6],array[5],array[4],array[3],array[2],array[1],array[0]} = idata;
     assign odata = array[select];
     
endmodule
