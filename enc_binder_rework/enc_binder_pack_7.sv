module enc_binder_pack_7(
    input  wire  	[HV_DIM-1:0] 	level_hv		[0:FEATURES_PER_CC-1],
    output logic	[HV_DIM-1:0] 	shifted_hv		[0:FEATURES_PER_CC-1]
);
                      
    for (genvar i = 0; i < FEATURES_PER_CC; i++) 
		begin : binders
			enc_binder #(.SHIFT(SHIFTS[434+i]))
			ENC_BINDER(
			    .level_hv						(level_hv[i]),
			    .shifted_hv						(shifted_hv[i])
			);
    	end	
	
endmodule