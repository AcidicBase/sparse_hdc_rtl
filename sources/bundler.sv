module bundler(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_bundling,                                  // asserted for #1000 (100 time units per CC, 10 CCs)
    input wire [FEATURE_COUNT-1:0] bits_to_bundle,
    input wire [3:0] sel,
    output logic thresholded_bit
    );
    
    logic [TREE_ADDER_INPUT_SIZE-1:0] mux_out;
    
    wire [TREE_ADDER_OUTPUT_SIZE-1:0] partial_sum;              // extend to F = 617 later
    wire [1:0] tree_add_lvl_0 [0:1];
    
    
    // 16x1 bundler MUX   
    always_comb begin
        case(sel)
            4'd0: mux_out = bits_to_bundle[3:0];                // change to bits_to_bundle[63:0] if F = 617
            4'd1: mux_out = bits_to_bundle[7:4];
            4'd2: mux_out = bits_to_bundle[11:8];
            4'd3: mux_out = bits_to_bundle[15:12];
            4'd4: mux_out = bits_to_bundle[19:16];
            4'd5: mux_out = bits_to_bundle[23:20];
            4'd6: mux_out = bits_to_bundle[27:24];
            4'd7: mux_out = bits_to_bundle[31:28];
            4'd8: mux_out = bits_to_bundle[35:32];
            4'd9: mux_out = bits_to_bundle[39:36];    
            default: mux_out = 4'b0;           
        endcase
    end
  
    // Binary Tree Adder  
    // when extended, try using a for loop. It works for assign statements.  
    assign tree_add_lvl_0[0] = mux_out[0] + mux_out[1];
    assign tree_add_lvl_0[1] = mux_out[2] + mux_out[3];  
    assign partial_sum = tree_add_lvl_0[0] + tree_add_lvl_0[1]; 
    
    // update accumulated_sum.
    logic [9:0] accumulated_sum; 
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           accumulated_sum <= 0;
        end 
        else begin
            if (en) begin
                if(start_bundling) begin                   
                    accumulated_sum <= accumulated_sum + partial_sum; 
                end 
                else begin                    
                    accumulated_sum <= 0; // reset registers
                end
            end 
            else begin
                accumulated_sum <= accumulated_sum;
            end
        end      
    end
  
    // update thresholded_bit  
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           thresholded_bit <= 1'b0;
        end 
        else begin
            if ((sel == SEQ_BUNDLER_CYCLES) && en) begin
                thresholded_bit <= (accumulated_sum >= ENCODING_BIT_THR) ? 1'b1 : 1'b0;
            end 
            else begin
                thresholded_bit <= thresholded_bit;
            end
        end      
    end   
                 
endmodule  