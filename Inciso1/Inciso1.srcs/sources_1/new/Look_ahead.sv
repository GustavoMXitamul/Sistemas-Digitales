`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2024 05:05:50
// Design Name: 
// Module Name: Look_ahead
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


module Look_ahead(
    input logic A, B, Cin,
    output logic P, G, Cout
);

    assign P = A ^ B;
    assign G = A & B;
    assign Cout = G | (P & Cin);

endmodule