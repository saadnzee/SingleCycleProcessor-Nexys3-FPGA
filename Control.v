`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:21 03/18/2024 
// Design Name: 
// Module Name:    Control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Control(
input [6:0] opcode,
output reg [1:0] ALUOp,
output reg RegDst,
output reg Branch,
output reg MemRead,
output reg MemtoReg,
output reg MemWrite,
output reg ALUSrc,
output reg RegWrite,
output reg jump
);
always@(opcode) begin
// R-Type
if (opcode == 7'd0) begin
ALUOp <= 2'b00;
RegDst <= 1'b1;
RegWrite <= 1'b1;
ALUSrc <= 1'b0;
MemtoReg <= 1'b0;
MemWrite <= 1'b0;
MemRead <= 1'b0;
Branch <= 1'b0;
jump <= 1'b0;
end
// I-Type (addi,subi,muli)
else if (opcode == 7'd8) begin
ALUOp <= 2'b10;
RegDst <= 1'b0;
RegWrite <= 1'b1;
ALUSrc <= 1'b1;
MemtoReg <= 1'b0;
MemWrite <= 1'b0;
MemRead <= 1'b0;
Branch <= 1'b0;
jump <= 1'b0;
end
// Load Word
else if (opcode == 7'd35) begin
ALUOp <= 2'b10;
RegDst <= 1'b0;
RegWrite <= 1'b1;
ALUSrc <= 1'b1;
MemtoReg <= 1'b1;
MemWrite <= 1'b0;
MemRead <= 1'b1;
Branch <= 1'b0;
jump <= 1'b0;
end
// Store Word
else if (opcode == 7'd43) begin
ALUOp <= 2'b10;
RegDst <= 1'b1;
RegWrite <= 1'b0;
ALUSrc <= 1'b1;
MemtoReg <= 1'b0;
MemWrite <= 1'b1;
MemRead <= 1'b0;
Branch <= 1'b0;
jump <= 1'b0;
end
// BEQ
else if (opcode == 7'd4) begin
ALUOp <= 2'b01;
RegDst <= 1'b1;
RegWrite <= 1'b0;
ALUSrc <= 1'b0;
MemtoReg <= 1'b0;
MemWrite <= 1'b0;
MemRead <= 1'b0;
Branch <= 1'b1;
jump <= 1'b0;
end
else if (opcode == 7'd2) begin
ALUOp <= 2'b00;
RegDst <= 1'b0;
RegWrite <= 1'b0;
ALUSrc <= 1'b0;
MemtoReg <= 1'b0;
MemWrite <= 1'b0;
MemRead <= 1'b0;
Branch <= 1'b0;
jump <= 1'b1;
end
else begin
ALUOp <= 2'b00;
RegDst <= 1'b0;
RegWrite <= 1'b0;
ALUSrc <= 1'b0;
MemtoReg <= 1'b0;
MemWrite <= 1'b0;
MemRead <= 1'b0;
Branch <= 1'b0;
jump <= 1'b0;
end
end
endmodule
