`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 16:30:48
// Design Name: 
// Module Name: kogge_stone
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

module sumador_kogge_stone_4bit(
    input logic sw [8:0],    // Entradas A0 a B3 y Cin
    output logic LED0, LED1, LED2, LED3, LED4  // Salida de acarreo
);

    logic P0, G0, P1, G1, P2, G2, P3, G3, P0_temporal, G0_temporal, P1_temporal, G1_temporal, P2_temporal, G2_temporal;

    Component1 component1_0 (.Input1(sw[1]), .Input2(sw[5]), .Output1(P0), .Output2(G0));
    Component1 component1_1 (.Input1(sw[2]), .Input2(sw[6]), .Output1(P1), .Output2(G1));
    Component1 component1_2 (.Input1(sw[3]), .Input2(sw[7]), .Output1(P2), .Output2(G2));
    Component1 component1_3 (.Input1(sw[4]), .Input2(sw[8]), .Output1(P3), .Output2(G3));

    Component2 component2_0 (.Input1(G0), .Input2(P0), .Input3(1'b0), .Input4(1'b0), .Output1(P0_temporal), .Output2(G0_temporal));
    Component2 component2_1 (.Input1(G1), .Input2(P1), .Input3(G0), .Input4(P0), .Output1(P1_temporal), .Output2(G1_temporal));
    Component2 component2_2 (.Input1(G2), .Input2(P2), .Input3(G1), .Input4(P1), .Output1(P2_temporal), .Output2(G2_temporal));

    Component3 component3_0 (.Input1(G0), .Input2(P0), .Input3(G0_temporal), .Input4(P0_temporal), .Output1(P0_temporal), .Output2(G0_temporal));
    Component3 component3_1 (.Input1(G1), .Input2(P1), .Input3(G1_temporal), .Input4(P1_temporal), .Output1(P1_temporal), .Output2(G1_temporal));
    Component3 component3_2 (.Input1(G2), .Input2(P2), .Input3(G2_temporal), .Input4(P2_temporal), .Output1(P2_temporal), .Output2(G2_temporal));

    Component4 component4_0 (.Input1(P0), .Input2(sw[0]), .Output1(LED0));
    Component4 component4_1 (.Input1(P1), .Input2(G0_temporal), .Output1(LED1));
    Component4 component4_2 (.Input1(P2), .Input2(G1_temporal), .Output1(LED2));
    Component4 component4_3 (.Input1(P3), .Input2(G2_temporal), .Output1(LED3));

    assign LED4 = G2_temporal;

endmodule


module Component1(
    input logic Input1, Input2, // Define las entradas Input1 y Input2
    output logic Output1, Output2   // Define las salidas Output1 y Output2
);

    // Implementa la lógica para las operaciones
    assign Output1 = Input1 ^ Input2; // Output1 es el resultado de Input1 XOR Input2
    assign Output2 = Input1 & Input2; // Output2 es el resultado de Input1 AND Input2

endmodule


module Component2(
    input logic Input1, Input2, Input3, Input4, // Define las entradas Input1, Input2, Input3, Input4
    output logic Output1, Output2               // Define las salidas Output1 y Output2
);

    // Implementa la lógica para las operaciones
    assign Output1 = Input2 & Input4;           // Output1 es el resultado de Input2 AND Input4
    assign Output2 = (Input2 & Input3) | Input1; // Output2 es el resultado de (Input2 AND Input3) OR Input1

endmodule


module Component3(
    input logic Input1, Input2, Input3, Input4, // Define las entradas Input1, Input2, Input3, Input4
    output logic Output1, Output2               // Define las salidas Output1 y Output2
);

    // Implementa la lógica para las operaciones
    assign Output1 = Input2; // Output1 toma directamente el valor de Input2
    assign Output2 = Input1; // Output2 toma directamente el valor de Input1

endmodule


module Component4(
    input logic Input1, Input2, // Define las entradas Input1 y Input2
    output logic Output1        // Define la salida Output1
);

    // Implementa la lógica para las operaciones
    assign Output1 = Input1 ^ Input2; // Output1 es el resultado de Input1 XOR Input2

endmodule
