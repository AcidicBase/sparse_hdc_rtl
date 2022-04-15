module bundler(
    input wire [FEATURE_COUNT-1:0] bits_to_bundle,
    output wire thresholded_bit
    );
       
    // Binary Tree Adder  
    wire [1:0] tree_add_lvl_0[0:19];
    wire [2:0] tree_add_lvl_1[0:9];
    wire [3:0] tree_add_lvl_2[0:4];
    wire [4:0] tree_add_lvl_3[0:1];
    wire [5:0] tree_add_lvl_4;
    wire [6:0] accumulated_sum;
  
    // Tree adder level 0
    for (genvar i = 0; i < 20; i++ ) begin
      assign tree_add_lvl_0[i] = bits_to_bundle[2*i] + bits_to_bundle[(2*i)+1];
    end
      
    // Tree adder level 1
    for (genvar i = 0; i < 10; i++ ) begin
      assign tree_add_lvl_1[i] = tree_add_lvl_0[2*i] + tree_add_lvl_0[(2*i)+1];
    end
    
    // Tree adder level 2
    for (genvar i = 0; i < 5; i++ ) begin
      assign tree_add_lvl_2[i] = tree_add_lvl_1[2*i] + tree_add_lvl_1[(2*i)+1];
    end
    
    // Tree adder level 3
    for (genvar i = 0; i < 2; i++ ) begin
      assign tree_add_lvl_3[i] = tree_add_lvl_2[2*i] + tree_add_lvl_2[(2*i)+1];
    end
    
    // Tree adder level 4
    assign tree_add_lvl_4 = tree_add_lvl_3[0] + tree_add_lvl_3[1];

    // Accumulated sum
    assign accumulated_sum = tree_add_lvl_4 + tree_add_lvl_2[4]; 
    
    
    // update thresholded_bit  
    assign thresholded_bit = (accumulated_sum > ENCODING_BIT_THR-1) ? 1'b1 : 1'b0;
  
                 
endmodule  