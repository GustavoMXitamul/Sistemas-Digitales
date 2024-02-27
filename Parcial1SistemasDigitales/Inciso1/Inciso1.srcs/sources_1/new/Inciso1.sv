`timescale 1ns / 1ps


module sumador_un_bit(
    input logic a, b, cin,
    output logic s, acarry
    );
    
    logic p, g; 
    always_comb begin
        p = a ^ b;
        g = a & b;
        s = p ^ cin;
        acarry = g | (p & cin);
    end

endmodule


module sumador_dos_bits(
    input logic A0, B0, A1, B1, Cin,
    output logic s0, s1, acarry
    );

    logic acarry_bit0;
    
    sumador_un_bit sumador_bit0 (.a(A0), .b(B0), .cin(Cin), .s(s0), .acarry(acarry_bit0));
    sumador_un_bit sumador_bit1 (.a(A1), .b(B1), .cin(acarry_bit0), .s(s1), .acarry(acarry));
    

endmodule

module sumador_cuatro_bits(
    input logic A0, B0, A1, B1, A2, B2, A3, B3, Cin,
    output logic s0, s1, s2, s3, acarry
    );

    logic acarry_bit0;

    sumador_dos_bits sumador_bits0_1 (.A0(A0), .B0(B0), .A1(A1), .B1(B1), .Cin(Cin), .s0(s0), .s1(s1), .acarry(acarry_bit0));
    sumador_dos_bits sumador_bits2_3 (.A0(A2), .B0(B2), .A1(A3), .B1(B3), .Cin(acarry_bit0), .s0(s2), .s1(s3), .acarry(acarry));
endmodule
    

module sumador_ocho_bits(
    input logic [16:0] sw,
    output logic [8:0] LED
    );

    logic acarry_bit3;

    // Primera instancia de sumador_cuatro_bits para sumar los bits 0 a 3
    sumador_cuatro_bits sumador_03 (.A0(sw[0]), .B0(sw[1]), .A1(sw[2]), .B1(sw[3]), .A2(sw[4]), .B2(sw[5]), .A3(sw[6]), .B3(sw[7]), .Cin(sw[8]), .s0(LED[0]), .s1(LED[1]), .s2(LED[2]), .s3(LED[3]), .acarry(acarry_bit3));
    sumador_cuatro_bits sumador_47 (.A0(sw[9]), .B0(sw[10]), .A1(sw[11]), .B1(sw[12]), .A2(sw[13]), .B2(sw[14]), .A3(sw[15]), .B3(sw[16]), .Cin(acarry_bit3), .s0(LED[4]), .s1(LED[5]), .s2(LED[6]), .s3(LED[7]), .acarry(LED[8]));
endmodule

