module class_thresholder( 
	input  wire												binarizing_class_hvs, 
    input  wire 	[DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] class_thresholder_in,
    output logic 	[DIMS_PER_CC-1:0] 						thresholded_hv
    );

	wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] class_hv_to_threshold;

	assign class_hv_to_threshold = (binarizing_class_hvs) ? class_thresholder_in : '0;

	always_comb begin
        for(int i = 0; i < DIMS_PER_CC; i++) begin
		    thresholded_hv[i] = (class_hv_to_threshold[i] > CLASS_BIT_THR) ? 1'b1 : 1'b0;
        end
	end
 
endmodule
