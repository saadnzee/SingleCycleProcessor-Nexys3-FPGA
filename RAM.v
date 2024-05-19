`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:12 03/18/2024 
// Design Name: 
// Module Name:    RAM 
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
module RAM(
input MemWrite,
input MemRead,
input [31:0] addr,
input [31:0] write_Data,
input clk,
input rst,
output reg [31:0] Result
);
reg [31:0] Data_Mem [31:0];
initial begin
Data_Mem[0] = 32'b0000000000000000;
Data_Mem[1] = 32'b0000000000000000;
Data_Mem[2] = 32'b0000000000000000;
Data_Mem[3] = 32'b0000000000000000;
Data_Mem[4] = 32'b0000000000000000;
Data_Mem[5] = 32'b0000000000000000;
Data_Mem[6] = 32'b0000000000000000;
Data_Mem[7] = 32'b0000000000000101;
Data_Mem[8] = 32'b0000000000000000;
Data_Mem[9] = 32'b0000000000000000;
Data_Mem[10] = 32'b0000000000000000;
Data_Mem[11] = 32'b0000000000000000;
end
always@(posedge clk) begin
if(MemWrite) begin
Data_Mem[addr] <= write_Data;
end
end
always@(*) begin
if(MemRead) begin
Result <= Data_Mem[addr];
end
else Result <= 32'd0;
end
endmodule
