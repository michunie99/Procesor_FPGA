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

// /* Program do zadania 1.5
assign program[0]=32'h168000;
assign program[1]=32'h168104;
assign program[2]=32'h10e001;
assign program[3]=32'h10200;
assign program[4]=32'h132e602;
assign program[5]=32'h168301;
// */

/* sample program to test all instructions
assign program[0]=32'b00000000000101101000000000001111; //move R0 , 15
assign program[1]=32'b00000000000100000110000100000000; //move R1, R0

assign program[2]=32'b00000011000100000110011000000000; //jump R0
assign program[15]=32'b00000011000101101110011000000011; // jumpi 3
assign program[3]=32'b00000001001100111110011000110011; //jz Rx,imm shouldn't jump R0 = 15
assign program[4]=32'b00000001001100001110011000110011; //jz Rx,imm jumps
assign program[51]=32'b00000010001101001110011000000110; //jnz Rx, imm shouldn't jump R3 = 0
assign program[52]=32'b00000010001100001110011000000110; //jnz Rx, imm jumps jump to addr 6
assign program[6]=32'b00000000000100000001001000000000; //add Rd,Rx,Ry Rx+Ry save in Rd
assign program[7]=32'b00000000000100001110001100001110; //add Rd,Rx,imm (Rx = 15, b11110 = 14   Rx+imm = 29 save in Rd)

assign program[8]=32'b00000000000000010010010000000000;//and write to R4 AND of R1 and R2 
assign program[9]=32'b00000000000000011110010000000000;//andi write againg to R4 and of R1 and imm = 00000000
assign program[10]=32'b00000000000101000110110100000000;//load to  R5 form adres in R4 = 00000000 8'b00000001;
assign program[11]=32'b00000000001101101110110100000001;//loadi load to  R5 form adres imm=00000001 assign data_memory[1]=8'b00000010
*/
//-----------------------------------------------
assign data=program[address];
//-----------------------------------------------
endmodule
//-----------------------------------------------
