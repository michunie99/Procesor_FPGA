`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2021 14:22:37
// Design Name: 
// Module Name: 
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

module ALU(
    input [7:0] rx_mux,
    input [7:0] imm_mux,
    input [2:0]alu_op,
    output [7:0]alu_res
    );
    wire [7:0] AND_2_mux;wire [7:0] sum_2_mux;wire [7:0] equal_2_mux;
    
    equal_0 ALU_eq(
        .in_1(rx_mux),
        .out(equal_2_mux)
    );
    
    sum ALU_sum(
        .in_1(rx_mux),
        .in_2(imm_mux),
        .out(sum_2_mux)
    );
        
    AND ALU_AND(
        .in_1(rx_mux),
        .in_2(imm_mux),
        .out(sum_2_mux)
    );
    
    multiplexer alu_mux(
        .idata({8'h00,8'h00,8'h00,8'h00,imm_mux,equal_2_mux,sum_2_mux,AND_2_mux}),
        .select(alu_op),
        .odata(alu_res)  
    );
endmodule


module equal_0(
    input [7:0] in_1,
    output [7:0] out
    );
    assign out = (in_1 == 8'b0)?8'hff:8'h00;    
endmodule

module sum(
    input [7:0] in_1,
    input [7:0] in_2,
    output [7:0] out
    );
    assign out = in_1 + in_2;
endmodule


module AND(
    input [7:0] in_1,
    input [7:0] in_2,
    output [7:0] out
    );
    assign out = in_1 & in_2;
endmodule
