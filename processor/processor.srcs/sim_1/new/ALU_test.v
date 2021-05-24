`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2021 11:36:21
// Design Name: 
// Module Name: ALU_test
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


module ALU_test(

    );
    wire [7:0]alu_res;
    reg [7:0]in_1 = 8'd0;
    reg [7:0]in_2 = 8'd10;
    reg [2:0]alu_op = 3'd0;
    
    
    ALU test_alu(
    .rx_mux(in_1),
    .imm_mux(in_2),
    .alu_op(alu_op),
    .alu_res(alu_res)
    );
    
    initial
    begin
        while(1)
        begin
            #10;alu_op <= alu_op + 3'd1;
        end
    end
endmodule
