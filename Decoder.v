`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:12 03/18/2024 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(instr_in,rs,rd,rt,shamt,opcode,funct,im,jump_adr);
output [4:0] rs,rd,rt,shamt;
output [6:0] opcode;
output [5:0] funct;
output [25:0] jump_adr;
output [15:0] im;
input [31:0] instr_in;
// R-TYPE
assign opcode = {1'b0,instr_in[31:26]}; 
assign rs = instr_in[25:21];
assign rt = instr_in[20:16];
assign rd = instr_in[15:11];
assign shamt = instr_in[10:6];
assign funct = instr_in[5:0]; 
// I-Type 
assign opcode = {1'b0,instr_in[31:26]}; 
assign rs = instr_in[25:21];
assign rt = instr_in[20:16];
assign im = instr_in[15:0];
// J-Type
assign opcode = {1'b0,instr_in[31:26]}; 
assign jump_adr = instr_in[25:0];
endmodule
