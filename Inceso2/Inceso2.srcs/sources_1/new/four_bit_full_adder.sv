`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2024 03:32:43
// Design Name: 
// Module Name: four_bit_full_adder
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

module four_bit_full_adder(
input logic A0, B0, A1, B1, A2, B2, A3, B3, Cin,
output logic s0, s1, s2, s3, cout
    );

    logic cout_bit0;

    two_bit_full_adder adder_bits0_1 (.A0(A0), .B0(B0), .A1(A1), .B1(B1), .Cin(Cin), .s0(s0), .s1(s1), .cout(cout_bit0));
    two_bit_full_adder adder_bits2_3 (.A0(A2), .B0(B2), .A1(A3), .B1(B3), .Cin(cout_bit0), .s0(s2), .s1(s3), .cout(cout));
endmodule
    
    
  