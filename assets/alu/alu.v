`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2026 09:11:35 AM
// Design Name: 
// Module Name: alu
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


module alu (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALUControl,
    output reg [3:0] Y,
    output reg Overflow,
    output Zero
);

always @(*) begin
    Overflow = 1'b0;

    case (ALUControl)
        3'b000: Y = A & B;
        3'b001: Y = A | B;
        3'b010: begin
            Y = A + B;
            Overflow = (~(A[3] ^ B[3])) & (Y[3] ^ A[3]);
        end
        3'b110: begin
            Y = A - B;
            Overflow = (A[3] ^ B[3]) & (Y[3] ^ A[3]);
        end
        3'b111: Y = ($signed(A) < $signed(B)) ? 4'b0001 : 4'b0000;
        default: Y = 4'b0000;
    endcase
end

assign Zero = (Y == 4'b0000);

endmodule
