module class_mux_out(
	input  wire 											training_hdc_model,
	input  wire 											binarizing_class_hvs,
	input  wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	nonbin_class_reg_out,
	output wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	stored_hv_chunk,
	output wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	class_thresholder_in
	);
	
	assign stored_hv_chunk      = (training_hdc_model)   ? nonbin_class_reg_out : {DIMS_PER_CC{1'b0}};
    assign class_thresholder_in = (binarizing_class_hvs) ? nonbin_class_reg_out : {DIMS_PER_CC{1'b0}};

endmodule
