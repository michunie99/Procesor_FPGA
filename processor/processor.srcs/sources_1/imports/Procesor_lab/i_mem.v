`timescale 1ns / 1ps
//-----------------------------------------------
// Company: agh
//-----------------------------------------------
module i_mem
(
  input [7:0]address,
  output [31:0]data
);
//-----------------------------------------------
//instruction memory
wire [31:0]program[255:0];

// /* sample program to test all instructions
assign program[0]=32'b00000000000101101000000000001111; //move R0 , 15
assign program[1]=32'b00000000000100000110000100000000; //move R1, R0
assign program[2]=32'b00000011000100000110011000000000; //jump R0
assign program[15]=32'b00000011000101101110011000000011; // jumpi 3
assign program[3]=32'b00000001001100111110011000110011; //jz Rx,imm shouldn't jump R0 = 15
assign program[4]=32'b00000001001100001110011000110011; //jz Rx,imm jumps
assign program[51]=32'b00000010001101001110011000000110; //jnz Rx, imm shouldn't jump R3 = 0
assign program[52]=32'b00000010001100001110011000000110; //jnz Rx, imm jumps jump to addr 6
assign program[6]=32'b00000000000100000001001000000000; //add Rd,Rx,Ry Rx+Ry save in Rd
assign program[7]=32'b00000000000100001110001100001110; //add Rd,Rx,imm (Rx = 15, b11110 = 14   Rx+imm = 29 save in Rd
//*/
//-----------------------------------------------
assign data=program[address];
//-----------------------------------------------
endmodule
//-----------------------------------------------
