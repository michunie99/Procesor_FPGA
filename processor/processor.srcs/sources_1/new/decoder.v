`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2021 14:10:21
// Design Name: 
// Module Name: decoder
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


module decoder( //7 output multiplexer for ce signals in registers
    input [2:0]select,
    output [6:0]odata
    );
    assign odata[0] = ((select==3'd0)?1'b1:1'b0);
    assign odata[1] = ((select==3'd1)?1'b1:1'b0);
    assign odata[2] = ((select==3'd2)?1'b1:1'b0);
    assign odata[3] = ((select==3'd3)?1'b1:1'b0);
    assign odata[4] = ((select==3'd4)?1'b1:1'b0);
    assign odata[5] = ((select==3'd5)?1'b1:1'b0);
    assign odata[6] = ((select==3'd6)?1'b1:1'b0);
    
endmodule
