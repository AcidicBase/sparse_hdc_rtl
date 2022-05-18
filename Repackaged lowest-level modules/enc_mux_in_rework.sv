module enc_mux_in_rework(
	input 	wire 	[3:0] 				 	ctr,
	input 	wire 	 						bits_to_bundle_arr		[HV_DIM-1:0],
	output 	logic 						 	mux_out 				[DIMS_PER_CC-1:0]
	);   

    always_comb begin
        case(ctr)
			4'd0:    mux_out = bits_to_bundle_arr[499:0];
            4'd1:    mux_out = bits_to_bundle_arr[999:500];
            4'd2:    mux_out = bits_to_bundle_arr[1499:1000];
            4'd3:    mux_out = bits_to_bundle_arr[1999:1500];
            4'd4:    mux_out = bits_to_bundle_arr[2499:2000];
            4'd5:    mux_out = bits_to_bundle_arr[2999:2500];
            4'd6:    mux_out = bits_to_bundle_arr[3499:3000];
            4'd7:    mux_out = bits_to_bundle_arr[3999:3500];
            4'd8:    mux_out = bits_to_bundle_arr[4499:4000];
            4'd9:    mux_out = bits_to_bundle_arr[4999:4500];
			default: mux_out = '{DIMS_PER_CC{1'b0}};
        endcase
    end 

endmodule