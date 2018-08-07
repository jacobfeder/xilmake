`timescale 1ns / 1ps

// Generates a square wave at the given frequency
module frequency_synth #(
        // output frequency
        parameter frequency = 1_000,
        clk_freq = 100_000_000
    )
    (
        input clk,
        input reset,
        output freq_out
    );
    
    // ----------------------------------------------------------
    // ---------------------- includes --------------------------
    // ----------------------------------------------------------
    
    `include "clogb2.vh"
    
    // ----------------------------------------------------------
    // --------------------- parameters -------------------------
    // ----------------------------------------------------------
    
    localparam divider = clk_freq / frequency;
    localparam divider2 = divider / 2;
    localparam N = clogb2(divider);
    
    // ----------------------------------------------------------
    // ------------------------ code ----------------------------
    // ----------------------------------------------------------
    
    reg [N:0] counter = 0;
    reg [N:0] counter_p1 = 1;
    always @(posedge clk) begin
        counter_p1 <= counter_p1 + 1;
        if (reset) begin
            counter <= 0;
            counter_p1 <= 1;
        end else begin
            if (counter_p1 < divider) begin
                counter <= counter_p1;
            end else begin
                counter <= 0;
                counter_p1 <= 1;
            end
        end
    end
    
    assign freq_out = reset ? 0 : counter < divider2;
    
endmodule