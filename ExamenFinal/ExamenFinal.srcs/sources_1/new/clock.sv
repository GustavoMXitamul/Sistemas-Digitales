`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2024 21:26:21
// Design Name: 
// Module Name: clock
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

module clock
    (
    input logic clock_input,
    output logic clock_output
    );

    logic[31:0]myreg;

    always @(posedge clock_input)
        myreg +=1;

    assign clock_output = myreg[26];
endmodule
