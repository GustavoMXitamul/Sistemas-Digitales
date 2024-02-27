`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2024 02:00:58
// Design Name: 
// Module Name: two_bit_comparator
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


module two_bit_comparator(
    input logic sw [5:0],
    output logic LED0
    );
    
    one_bit_comparator eq_bit0_unit (.i0(sw[0]), .i1(sw[3]), .eq(p0));
    one_bit_comparator eq_bit1_unit (.eq(p1), .i0 (sw[1]), .i1 (sw[4]));
    one_bit_comparator eq_bit2_unit (.i0(sw[2]), .i1(sw[5]), .eq(p2));
    
    assign LED0 = p0 & p1 & p2;
    
endmodule
