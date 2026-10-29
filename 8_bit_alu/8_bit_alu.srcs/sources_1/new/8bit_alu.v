`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2026 21:00:21
// Design Name: 
// Module Name: 8bit_alu
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



module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] Sel,
    output reg [7:0] Result,
    output reg CarryOut,
    output Zero
);

always @(*) begin
    case (Sel)
        3'b000: {CarryOut, Result} = {1'b0, A} + {1'b0, B}; // Addition
        3'b001: {CarryOut, Result} = {1'b0, A} - {1'b0, B}; // Subtraction
        3'b010: {CarryOut, Result} = {1'b0, (A & B)};       // AND
        3'b011: {CarryOut, Result} = {1'b0, (A | B)};       // OR
        3'b100: {CarryOut, Result} = {1'b0, (A ^ B)};       // XOR
        default: {CarryOut, Result} = 9'b0;
    endcase
end

assign Zero = (Result == 8'b0) ? 1'b1 : 1'b0;

endmodule


