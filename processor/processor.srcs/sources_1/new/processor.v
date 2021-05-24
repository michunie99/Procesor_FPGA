`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2021 12:24:50
// Design Name: 
// Module Name: processor
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


module processor(
    input [31:0]instr,
    input clk,
    output pc_addr
    );
    //wire for controling mux and decoder
    wire [1:0]pc_op;
    wire [1:0]alu_op;
    wire [2:0]rx_op;
    wire imm_op;
    wire [2:0]ry_op;
    wire rd_op;
    wire [2:0]d_op;
    wire [7:0]imm;
    //assign instr to wires
    assign pc_op=instr[25:24];
    assign alu_op=instr[21:20];
    assign rx_op=instr[18:16]
;
    assign imm_op=instr[15];
    assign ry_op=instr[14:12];
    assign rd_op=instr[11];
    assign d_op=instr[10:8];
    assign imm[7:0]=instr[7:0];
    //wires for mux outputs
    wire [7:0]rd_mux;
    wire [7:0]pc_mux;
    wire [7:0]rx_mux;
    wire [7:0]ry_mux;
    wire [7:0]alu_mux;
    wire [7:0]imm_mux;
    //decoder unit for ce in r0-r6
    wire [6:0]decoder;
    decoder decoder_(
        .select(d_op),
        .odata(decoder)
    );
    //registers
    wire [7:0]r0;wire [7:0]r1;wire [7:0]r2;
    wire [7:0]r3;wire [7:0]r4;wire [7:0]r5;
    wire [7:0]r6;wire [7:0]r7;
    
    register r0_(
        .idata(rd_mux),
        .clk(clk),
        .ce(decoder[0]),
        .odata(r0)
    );
    register r1_(
        .idata(rd_mux),
        .clk(clk),
        .ce(decoder[1]),
        .odata(r1)
    );
    register r2_(
        .idata(rd_mux),
        .clk(clk),
        .ce(decoder[2]),
        .odata(r2)
    );
    register r3_(
        .idata(rd_mux),
        .clk(clk),
        .ce(decoder[3]),
        .odata(r3)
    );
    register r4_(
        .idata(rd_mux),
        .clk(clk),
        .ce(decoder[4]),
        .odata(r4)
    );
    register r5_(
        .idata(rd_mux),
        .clk(clk),
        .ce(decoder[5]),
        .odata(r5)
    );  
    register r6_(
        .idata(7'h00),
        .clk(clk),
        .ce(decoder[6]),
        .odata(r6)
    );  
    register r7_(  //add logit to increment every clk cycle
        .idata(pc_mux),
        .clk(clk),
        .ce(1'b1),
        .odata(r7)
    );
    //multiplexers (exept alu_mux, inplemented in ALU module)
    multiplexer rd_mux_(
        .idata(alu),
        .select(),
        .odata(rd_mux)
    );
    multiplexer pc_mux_(
        .idata(),
        .select(),
        .odata(pc_mux)    
    );
    multiplexer rx_mux_(
        .idata(),
        .select(),
        .odata(rx_mux)   
    );
    multiplexer ry_mux_(
        .idata(),
        .select(),
        .odata(ry_mux)    
    );
    multiplexer imm_mux_(
        .idata(),
        .select(),
        .odata(imm_mux)    
    );
endmodule
