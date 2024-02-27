`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2024 04:10:28
// Design Name: 
// Module Name: eight_bit_full_adder
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

module sumador_ocho_bits(
    input logic [16:0] sw,
    output logic [8:0] LED
    );

    logic cout_bit3;

    // Instancia de sumador_cuatro_bits para sumar los bits 0 a 3
    sumador_cuatro_bits adder_03 (.A0(sw[0]), .B0(sw[1]), .A1(sw[2]), .B1(sw[3]), .A2(sw[4]), .B2(sw[5]), .A3(sw[6]), .B3(sw[7]), .Cin(sw[8]), .s0(LED[0]), .s1(LED[1]), .s2(LED[2]), .s3(LED[3]), .cout(cout_bit3));
    
    // Instancia de sumador_cuatro_bits para sumar los bits 4 a 7
    sumador_cuatro_bits adder_47 (.A0(sw[9]), .B0(sw[10]), .A1(sw[11]), .B1(sw[12]), .A2(sw[13]), .B2(sw[14]), .A3(sw[15]), .B3(sw[16]), .Cin(cout_bit3), .s0(LED[4]), .s1(LED[5]), .s2(LED[6]), .s3(LED[7]), .cout(LED[8]));

endmodule
