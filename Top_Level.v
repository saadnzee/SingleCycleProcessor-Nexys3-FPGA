`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:16 03/18/2024 
// Design Name: 
// Module Name:    Top_Level 
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
module Top_Level(
output [31:0] Rdata1,
output [31:0] Rdata2,
output [31:0] im,
output [31:0] ALU_Out,
output [31:0] instr,
output [31:0] PC_Out,
input rst,
input clk
);
wire zeroFlag,Branch;
wire Branch_trig;
assign Branch_trig = zeroFlag&&Branch;
wire [31:0] jump_adr;
wire [25:0] jump_adr_temp;
wire jump;
assign jump_adr = {{PC_Out[31:26]},jump_adr_temp};

PC uut1 (.clk(clk), .rst(rst), .PC_Out(PC_Out), .Branch_trig(Branch_trig), 
.Branch_adr(im), .jump(jump), .jump_adr(jump_adr));

ROM uut2 (.PC_In(PC_Out), .instr(instr));
wire [4:0] rs,rd,rt,shamt;
wire [6:0] opcode;
wire [5:0] funct;
wire [15:0] im_temp;
Decoder uut3 (.instr_in(instr), .rs(rs) , .rd(rd), .rt(rt), .shamt(shamt), 
.opcode(opcode), .funct(funct), .im(im_temp), .jump_adr(jump_adr_temp));
wire RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
wire [1:0] ALUOp;
Control uut4 (.opcode(opcode), .RegDst(RegDst), .Branch(Branch), 
.MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), 
.ALUSrc(ALUSrc), .RegWrite(RegWrite), .ALUOp(ALUOp), .jump(jump));
assign im = {{16{im_temp[15]}},im_temp};
reg [4:0] rd_sel;
always@* begin
if (RegDst == 1'b1) begin 
rd_sel <= rd; 
end
else begin 
rd_sel <= rt; 
end
end
wire [31:0] Rdata2_temp; // Data from Register File
reg [31:0] Rdata2_sel; // Can be either Data from Register File or Immediate Data
reg [31:0] Data_In; // Register File Input (Either ALU Output or RAM Output)
wire [31:0] Result; // RAM_OutPut
always@* begin
if (MemtoReg == 1'b0) begin 
Data_In <= ALU_Out;
end
else begin
Data_In <= Result;
end
end
RegisterFile uut5 (.rs(rs), .rt(rt), .rd(rd_sel), .clk(clk),.RegWrite(RegWrite), 
.Data_In(Data_In), .Rdata1(Rdata1), .Rdata2(Rdata2_temp));
always@* begin
if (ALUSrc == 1'b1) begin 
Rdata2_sel <= im;
end
else begin
Rdata2_sel <= Rdata2_temp;
end
end
assign Rdata2 = Rdata2_sel;
wire [3:0] ALUopcode;
ALUControl uut6 (.ALUOp(ALUOp), .funct(funct), .ALUopcode(ALUopcode));
ALU uut7 (.Rs(Rdata1), .Rt(Rdata2), .opcode(ALUopcode), .Data_Out(ALU_Out), 
.zeroFlag(zeroFlag));
RAM uut8 (.MemRead(MemRead), .MemWrite(MemWrite), .addr(ALU_Out), 
.write_Data(Rdata2_temp), .clk(clk), .rst(rst), .Result(Result));

endmodule
