module enc_nets_rework(
	input  wire 	[FEATURE_COUNT-1:0] 		shifted_hvs,
	output logic 	[FEATURE_COUNT-1:0] 		bits_to_bundle_arr 
	);   

	assign bits_to_bundle_arr = shifted_hvs;

endmodule