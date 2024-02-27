`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2024 05:21:04
// Design Name: 
// Module Name: two_bit_look_ahead
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


module two_bit_look_ahead(
    input logic [8:0]sw,
    output logic [4:0]LED
);

    logic p0, g0, p1, g1, p2, g2, p3, g3, C1, C2, C3;

    Look_ahead gen0 (.A(sw[0]), .B(sw[1]), .Cin(sw[2]), .P(p0), .G(g0), .Cout(C1));
    Look_ahead gen1 (.A(sw[3]), .B(sw[4]), .Cin(C1), .P(p1), .G(g1), .Cout(C2));
    Look_ahead gen2 (.A(sw[5]), .B(sw[6]), .Cin(C2), .P(p2), .G(g2), .Cout(C3));
    Look_ahead gen3 (.A(sw[7]), .B(sw[8]), .Cin(C3), .P(p3), .G(g3), .Cout(LED[4]));

    assign LED[0] = p0 ^ sw[2];
    assign LED[1] = p1 ^ C1;
    assign LED[2] = p2 ^ C2;
    assign LED[3] = p3 ^ C3;

endmodule
