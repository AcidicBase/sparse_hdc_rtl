module class_bundler(
    input wire 	[DIMS_PER_CC-1:0] 						input_hv_chunk,
    input wire 	[DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] stored_hv_chunk,
    output wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] sum
    );
      
    for (genvar i = 0; i < DIMS_PER_CC; i++ ) begin
        assign sum[i] = stored_hv_chunk[i] + input_hv_chunk[i];
    end

endmodule
