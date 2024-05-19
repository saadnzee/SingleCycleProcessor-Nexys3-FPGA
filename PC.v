`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:33 03/18/2024 
// Design Name: 
// Module Name:    PC 
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
module PC(
input clk,
input rst,
input [31:0] Branch_adr,
input [31:0] jump_adr,
input jump,
input Branch_trig,
output reg [31:0] PC_Out
);
initial begin 
PC_Out = 0;
end
always@(posedge clk, posedge rst) begin
if(rst)
PC_Out <= 0;
else if (Branch_trig == 1) begin 
PC_Out <= PC_Out + 1 + Branch_adr;
end
else if (jump == 1) begin
PC_Out <= jump_adr;
end
else
PC_Out <= PC_Out + 1;
end
endmodule
