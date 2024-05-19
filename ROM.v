`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:47 03/18/2024 
// Design Name: 
// Module Name:    ROM 
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
module ROM(
output reg [31:0] instr,
input [31:0] PC_In
);
reg [31:0] memory [31:0];
(*RAM_STYLE = "BLOCK"*)
initial begin 
$readmemb("instructionMemory.txt", memory);
// R-Type
/*
memory[0] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[1] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[2] = 32'b000000_00100_00001_00101_00000_100010; // sub
memory[3] = 32'b000000_00101_00100_00110_00000_100100; // mult
// I-Type
memory[4] = 32'b001000_00000_00001_00011_00000_100101; // addi
memory[5] = 32'b100011_00111_00100_00000_00000_000010; // LW // addr = 7, value = 5 :: rd/rt/destination = 4/100 
memory[6] = 32'b000000_00100_00001_00011_00000_100000; // R-Type ADD
memory[7] = 32'b101011_00111_00100_00000_00000_000011; // SW // add = 7, value = 5 :: 5 + 3, 8. Location 8 value saved
memory[8] = 32'b100011_00111_00101_00000_00000_000011; // LW from SW location
memory[9] = 32'b000000_00101_00001_00011_00000_100000; // R-Type ADD
memory[10] = 32'b000100_01000_01001_00000_00000_000011; // Branch = 3 + PC + 1 = 11 + 3 = 14 so Instr 14 is fetched
memory[11] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[12] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[13] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[14] = 32'b000000_01000_00001_00101_00000_100010; // sub (R-Type) from branch we come here
memory[15] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[16] = 32'b000010_00000_00000_00000_00000_010100; // Jump
memory[17] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[18] = 32'b000000_00000_00001_00100_00000_100000; // add
memory[19] = 32'b000000_01000_00001_00101_00000_100000; // add 
memory[20] = 32'b000000_00000_00001_00100_00000_100010; // sub (R-Type) after jump 
*/
end

always@(*) begin
instr <= memory[PC_In];
end

endmodule
