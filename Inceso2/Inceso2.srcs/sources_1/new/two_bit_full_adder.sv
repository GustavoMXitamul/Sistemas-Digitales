`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2024 16:38:06
// Design Name: 
// Module Name: two_bit_full_adder
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
module sumador_dos_bits(
    input logic A0, B0, A1, B1, Cin,
    output logic s0, s1, cout
    );

    logic cout_bit;

    sumador_un_bit adder_bit0 (.a(A0), .b(B0), .cin(Cin), .s(s0), .cout(cout_bit));
    sumador_un_bit adder_bit1 (.a(A1), .b(B1), .cin(cout_bit), .s(s1), .cout(cout));

endmodule





