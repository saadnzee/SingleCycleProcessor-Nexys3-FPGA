`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:39 03/18/2024 
// Design Name: 
// Module Name:    ALUControl 
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
module ALUControl(
input [1:0] ALUOp,
input [5:0] funct,
output reg [3:0] ALUopcode // goes into ALU (decides operation)
);

always@* begin
// R-TYPE
if(ALUOp == 2'b00) begin // R-Type
 if (funct == 6'b100000) begin // add
 ALUopcode <= 4'b0000;
 end
 else if (funct == 6'b100010) begin // sub
 ALUopcode <= 4'b0001;
 end
 else if (funct == 6'b100100) begin // mult
 ALUopcode <= 4'b0010;
 end
 else ALUopcode <= 4'b0000;
end 
// I-Type
else if(ALUOp == 2'b10) begin // I-Type
 if (funct == 6'b100101) begin // addi
 ALUopcode <= 4'b0000;
 end
 else if (funct == 6'b100110) begin // subi
 ALUopcode <= 4'b0001;
 end
 else if (funct == 6'b101000) begin // muli
 ALUopcode <= 4'b0010;
 end
 else begin // LW,SW
 ALUopcode <= 4'b0000; // add
 end
end
// Branch
else if(ALUOp == 2'b01) begin 
 ALUopcode <= 4'b0001;
end
else ALUopcode <= 4'b0000;
end
endmodule
