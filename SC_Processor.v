`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:50 03/18/2024 
// Design Name: 
// Module Name:    SC_Processor 
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
module SC_Processor(
input clk_pr,
input clk_seg, 
input rst,
input [3:0] sw,
output [6:0] seg_out,
output [3:0] an
);

wire [31:0] Rdata1;
wire [31:0] Rdata2;
wire [31:0] im;
wire [31:0] ALU_Out;
wire [31:0] instr;
wire [31:0] PC_Out;

Top_Level uut10 (.clk(clk_pr), .rst(rst), .Rdata1(Rdata1), .Rdata2(Rdata2), .im(im), .ALU_Out(ALU_Out), .instr(instr), .PC_Out(PC_Out));

reg [15:0] Data;

always@* begin
 case(sw)
  4'b0000: Data <= PC_Out[15:0];
  4'b0001: Data <= PC_Out[31:16];
  4'b0010: Data <= instr[15:0];
  4'b0011: Data <= instr[31:16];
  4'b0100: Data <= Rdata1[15:0];
  4'b0101: Data <= Rdata1[31:16];
  4'b0110: Data <= Rdata2[15:0];
  4'b0111: Data <= Rdata2[31:16];
  4'b1000: Data <= ALU_Out[15:0];
  4'b1001: Data <= ALU_Out[31:16];
 endcase
end

wire [3:0] hex;
time_Multiplexer uut11 (.clk(clk_seg), .data(Data), .hex(hex), .an(an));
hexDecoder uut12 (.hexIn(hex), .sevenOut(seg_out));

endmodule
