`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2026 09:17:29 AM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb;

reg [3:0] A;
reg [3:0] B;
reg [2:0] ALUControl;

wire [3:0] Y;
wire Overflow;
wire Zero;

alu uut (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Y(Y),
    .Overflow(Overflow),
    .Zero(Zero)
);

initial begin
    A = 4'b0001; B = 4'b0101; ALUControl = 3'b010;
    #10;

    A = 4'b1101; B = 4'b1011; ALUControl = 3'b000;
    #10;

    A = 4'b1101; B = 4'b1011; ALUControl = 3'b001;
    #10;

    A = 4'b0110; B = 4'b0011; ALUControl = 3'b110;
    #10;

    A = 4'b0011; B = 4'b0011; ALUControl = 3'b110;
    #10;

    A = 4'b0111; B = 4'b0001; ALUControl = 3'b010;
    #10;

    $finish;
end

endmodule
