`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2021 15:10:01
// Design Name: 
// Module Name: register
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


module register(
    input [7:0] idata,
    input clk,
    input ce,
    output [7:0] odata
    );
    reg [7:0] data = 8'h00;
    always @(posedge clk)
    begin
        if(ce) data <= idata;
        else data <= data;
    end
    assign odata = data;
endmodule
