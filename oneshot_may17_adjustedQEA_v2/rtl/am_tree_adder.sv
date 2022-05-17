module am_tree_adder(
    input wire 					          	clk,
    input wire 				          		nrst, 
    input wire 					            comparing_query_hv_with_class_hv,
    input wire 				          		inferring_class,
    input wire   [DIMS_PER_CC-1:0] 	and_array_out,
    output logic [12:0] 			      similarity_value     // 13 bits to represent 5k-dim hvs
    );
    
    // Tree adder 									    // add 500 bits per cycle
    wire [1:0] 	tree_add_lvl_0	[250];
    wire [2:0] 	tree_add_lvl_1	[125];
    wire [3:0] 	tree_add_lvl_2	[62];
    wire [4:0] 	tree_add_lvl_3	[31];
    wire [5:0] 	tree_add_lvl_4	[16];
    wire [6:0] 	tree_add_lvl_5	[8];
    wire [7:0] 	tree_add_lvl_6	[4];
    wire [8:0] 	tree_add_lvl_7	[2];
    wire [9:0] 	partial_sum;
      
    // Tree adder level 0
    for (genvar i = 0; i < 250; i++ ) begin
      assign tree_add_lvl_0[i] = and_array_out[2*i] + and_array_out[(2*i)+1];
    end
    
    // Tree adder level 1
    for (genvar i = 0; i < 125; i++ ) begin
      assign tree_add_lvl_1[i] = tree_add_lvl_0[2*i] + tree_add_lvl_0[(2*i)+1];
    end

    // Tree adder level 2
    for (genvar i = 0; i < 62; i++ ) begin
      assign tree_add_lvl_2[i] = tree_add_lvl_1[2*i] + tree_add_lvl_1[(2*i)+1];
    end

    // Tree adder level 3
    for (genvar i = 0; i < 31; i++ ) begin
      assign tree_add_lvl_3[i] = tree_add_lvl_2[2*i] + tree_add_lvl_2[(2*i)+1];
    end

    // Tree adder level 4
    for (genvar i = 0; i < 15; i++ ) begin
      assign tree_add_lvl_4[i] = tree_add_lvl_3[2*i] + tree_add_lvl_3[(2*i)+1];
    end

	assign tree_add_lvl_4[15] = tree_add_lvl_3[30] + tree_add_lvl_1[124];

    // Tree adder level 5
    for (genvar i = 0; i < 8; i++ ) begin
      assign tree_add_lvl_5[i] = tree_add_lvl_4[2*i] + tree_add_lvl_4[(2*i)+1];
    end

    // Tree adder level 6
    for (genvar i = 0; i < 4; i++ ) begin
      assign tree_add_lvl_6[i] = tree_add_lvl_5[2*i] + tree_add_lvl_5[(2*i)+1];
    end

    // Tree adder level 7
    for (genvar i = 0; i < 2; i++ ) begin
      assign tree_add_lvl_7[i] = tree_add_lvl_6[2*i] + tree_add_lvl_6[(2*i)+1];
    end

    // partial_sum
    assign partial_sum = tree_add_lvl_7[0] + tree_add_lvl_7[1];   
    
    // Accumulator
    always_ff @(posedge clk or negedge nrst) begin
        if(!nrst) begin
            similarity_value <= 0;
        end
        else if (comparing_query_hv_with_class_hv) begin
            similarity_value <= similarity_value + partial_sum;
        end
        else if (inferring_class) begin
            similarity_value <= similarity_value;       // hold value while comparing similarity values
        end
        else begin
            similarity_value <= 0;                      // reset to 0
        end
        
    end
    
endmodule
