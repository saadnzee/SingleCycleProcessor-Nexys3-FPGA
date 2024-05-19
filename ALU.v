`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:36 03/18/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
output reg [31:0] Data_Out,
output reg zeroFlag,
input [31:0] Rs,
input [31:0] Rt,
input [3:0] opcode
);
always@(Rs, Rt, opcode) begin
case(opcode)
4'b0000: Data_Out = Rs+Rt;
4'b0001: begin 
Data_Out = Rs-Rt;
if (Data_Out == 0) begin
 zeroFlag <= 1'b1;
end
else begin zeroFlag<=0; end
end
4'b0010: Data_Out = Rs*Rt;
default: Data_Out = 32'd0;
endcase
end
endmodule
