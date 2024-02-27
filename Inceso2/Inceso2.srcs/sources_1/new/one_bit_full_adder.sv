`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2024 16:24:44
// Design Name: 
// Module Name: one_bit_full_adder
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


module sumador_un_bit(
    input logic a, b, cin,
    output logic s,cout
    );
    
    logic p, g; 
    always_comb
        begin
            p = a ^ b ;
            g = a | b;
            s = p ^ cin;
            cout = g | (~cin);
         end

endmodule
