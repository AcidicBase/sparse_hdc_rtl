module am_tree_adder(                                   // generate 26 of these
    input wire clk,
    input wire nrst, 
    input wire comparing_query_hv_with_class_hv,
    input wire inferring_class,
    input wire [DIMS_PER_CC-1:0] and_array_out,
    output logic [12:0] similarity_value              // 13 bits to represent 5k-dim hvs
    );
    
    // Tree adder                                      - extend this to DIMS_PER_CC = 500 bits
    wire [1:0] tree_add_lvl_0[0:3];
    wire [2:0] tree_add_lvl_1[0:1];
    wire [3:0] partial_sum;                          // extend to represent 500 dims at a time (9 bits)
      
    // Tree adder level 0
    for (genvar i = 0; i < 4; i++ ) begin
      assign tree_add_lvl_0[i] = and_array_out[2*i] + and_array_out[(2*i)+1];
    end
      
    // Tree adder level 1
    for (genvar i = 0; i < 2; i++ ) begin
      assign tree_add_lvl_1[i] = tree_add_lvl_0[2*i] + tree_add_lvl_0[(2*i)+1];
    end

    // partial_sum
    assign partial_sum = tree_add_lvl_1[0] + tree_add_lvl_1[1];   
    
    // Accumulator
    always_ff @(posedge clk or negedge nrst) begin
        if(!nrst) begin
            similarity_value <= 0;
        end
        else if (comparing_query_hv_with_class_hv) begin
            similarity_value <= similarity_value + partial_sum;
        end
        else if (inferring_class) begin
            similarity_value <= similarity_value;       //hold value while comparing similarity values
        end
        else begin
            similarity_value <= 0;                      // reset to 0
        end
        
    end
    
endmodule