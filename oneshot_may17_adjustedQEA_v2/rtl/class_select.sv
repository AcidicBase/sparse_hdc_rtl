module class_select(
	input  wire			training_hdc_model,
	input  wire 		binarizing_class_hvs,
	input  wire [4:0] 	binarized_class_counter,
	input  wire [4:0] 	class_select_bits,
	output wire [4:0]	training_class_select_bits,
	output wire [4:0] 	nonbin_class_select_bits
	);

	assign training_class_select_bits = (training_hdc_model)   ? class_select_bits       : 5'b0;
	assign nonbin_class_select_bits   = (binarizing_class_hvs) ? binarized_class_counter : training_class_select_bits;

endmodule
