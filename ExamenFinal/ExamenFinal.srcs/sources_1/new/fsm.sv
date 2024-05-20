module fsm_logic
    (
    input logic clk,
    input logic reset,
    input logic PA, PB, E, TA, TB, // Entradas del sistema
    output logic LAG, LAY, LAR, LBG, LBY, LBR                      // Salidas del sistema
    );

    typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
    statetype state, nextstate;
    
    logic out1, out2, out3, out4, out5, out6, out7, out8;


    // State Register
    always_ff @(posedge clk, posedge reset)
        if (reset) state <= S0;
        else state <= nextstate;

    // Next State Logic based on provided expressions
    always_comb
        case (state)
        S0: begin
            // Conditions for transitioning from S0 to S1
            if ((~PA & ~E) | (~PB & ~E) | (~E & TA) | (~E & TB) | (PA & PB & E & ~TB & ~TA))
                nextstate = S1;
            else
                nextstate = S0;
        end
        S1: begin
            // Conditions for transitioning from S1 to S2
            if ((~PA & ~PB & ~E) | (~E & TA) | (~E & TB) | (E & ~TB & ~TA))
                nextstate = S2;
            else
                nextstate = S1;
        end
        S2: begin
            // Conditions for transitioning from S2 to S3
            if ((PB & ~E & TB & TA) | (PB & E & ~TB & ~TA))
                nextstate = S3;
            else
                nextstate = S0; // Returns to S0 if conditions do not meet
        end
        S3: begin
            // S3 always transitions back to S0
            nextstate = S0;
        end
        default: nextstate = S0;
        endcase

 // Output Logic
    always_comb
        case (state)
            S0: begin {out1, out2, out3, out4, out5, out6} = 6'b100001; end
            S1: begin {out1, out2, out3, out4, out5, out6} = 6'b100010; end
            S2: begin {out1, out2, out3, out4, out5, out6} = 6'b001100; end
            S3: begin {out1, out2, out3, out4, out5, out6} = 6'b010100; end
            default:;
        endcase            
    
    assign LAG = out1;
    assign LAY = out2; 
    assign LAR = out3;
    assign LBG = out4;
    assign LBY = out5;
    assign LBR = out6;

endmodule
