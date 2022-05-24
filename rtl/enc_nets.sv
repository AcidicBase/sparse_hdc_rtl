 module enc_nets(
	input  wire 	[FEATURE_COUNT-1:0] hv_bits_per_dim,
	output wire 	[FEATURE_COUNT-1:0] bits_to_bundle
	);   

	assign bits_to_bundle = hv_bits_per_dim;
        
endmodule
