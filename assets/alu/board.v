`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2026 09:46:15 AM
// Design Name: 
// Module Name: board
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


module board (
    input  [15:0] sw,
    output [15:0] led
);

wire [3:0] A;
wire [3:0] B;
wire [2:0] ALUControl;
wire [3:0] Y;
wire Overflow;
wire Zero;

assign A = sw[3:0];
assign B = sw[7:4];
assign ALUControl = sw[15:13];

alu u0 (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Y(Y),
    .Overflow(Overflow),
    .Zero(Zero)
);

assign led[3:0] = Y;
assign led[13:4] = 10'b0;
assign led[14] = Zero;
assign led[15] = Overflow;

endmodule
