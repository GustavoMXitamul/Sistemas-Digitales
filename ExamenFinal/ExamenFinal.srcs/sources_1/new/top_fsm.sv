`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2024 20:52:58
// Design Name: 
// Module Name: fsm
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


module fsm(
    input logic CLK100MHZ,    input logic [5:0]sw,
    output logic [8:0]LED);
    // Internal signal declaration    logic internal_psc_clock;
    
    logic int_reset = 1'b0;
    // Body    
    clock clock_input (.clock_input(CLK100MHZ), .clock_output(internal_psc_clock));
    
    fsm_logic smfr (.clk(internal_psc_clock), .reset(sw[5]), .PA(sw[0]), .PB(sw[1]), 
    .E(sw[2]), .TA(sw[3]),.TB(sw[4]), .LAG(LED[0]), .LAY(LED[1]), .LAR(LED[2]),     
    .LBG(LED[4]), .LBY(LED[5]), .LBR(LED[6])) ;

    assign LED[8] = internal_psc_clock;

endmodule