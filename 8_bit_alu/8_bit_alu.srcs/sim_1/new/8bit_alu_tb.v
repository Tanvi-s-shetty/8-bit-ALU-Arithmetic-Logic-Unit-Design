`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2026 21:16:40
// Design Name: 
// Module Name: 8bit_alu_tb
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


`timescale 1ns/1ps

module tb_alu();

    reg [7:0] A, B;
    reg [2:0] Sel;

    wire [7:0] Result;
    wire CarryOut, Zero;

    // Instantiate ALU
    alu uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Result(Result),
        .CarryOut(CarryOut),
        .Zero(Zero)
    );

    initial begin
        // Generate waveform
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        // Test Addition
        A = 8'd15;
        B = 8'd10;
        Sel = 3'b000;
        #10;
        $display("Addition: A=%d, B=%d, Result=%d, CarryOut=%b, Zero=%b",
                  A, B, Result, CarryOut, Zero);

        // Test Subtraction
        A = 8'd20;
        B = 8'd5;
        Sel = 3'b001;
        #10;
        $display("Subtraction: A=%d, B=%d, Result=%d, CarryOut=%b, Zero=%b",
                  A, B, Result, CarryOut, Zero);

        // Test AND
        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 3'b010;
        #10;
        $display("AND: Result=%b", Result);

        // Test OR
        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 3'b011;
        #10;
        $display("OR: Result=%b", Result);

        // Test XOR
        A = 8'b11001100;
        B = 8'b10101010;
        Sel = 3'b100;
        #10;
        $display("XOR: Result=%b", Result);

        // Finish simulation
        $finish;
    end

endmodule
