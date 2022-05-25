module enc_binder_pack_9(
    input  wire  					clk,
    input  wire  					nrst,
    input  wire  					start_encoding,
    input  wire  	[HV_DIM-1:0] 	level_hv		[0:((FEATURES_PER_CC/2)-1)],
    output logic	[HV_DIM-1:0] 	shifted_hv		[0:((FEATURES_PER_CC/2)-1)]
);
                      
    for (genvar i = 0; i < (FEATURES_PER_CC/2); i++) 
		begin : binders
			enc_binder #(.SHIFT(SHIFTS[279+i]))
			ENC_BINDER(
			    .clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
			    .level_hv						(level_hv[i]),
			    .shifted_hv						(shifted_hv[i])
			);
    	end	
	
endmodule