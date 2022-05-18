module enc_binder_pack_8(
    input  wire  					clk,
    input  wire  					nrst,
    input  wire  					start_encoding,
	input  wire						en,
    input  wire  	[HV_DIM-1:0] 	level_hv		[0:FEATURES_PER_CC],
    output logic	[HV_DIM-1:0] 	shifted_hv		[0:FEATURES_PER_CC]
);
                      

    for (genvar i = 0; i < FEATURES_PER_CC; i++) 
		begin : binders
			enc_binder #(.SHIFT(SHIFTS[496:+i]))
			ENC_BINDER(
			    .clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding && en),
			    .level_hv						(level_hvs[i]),
			    .shifted_hv						(shifted_hvs[i])
			);
    	end
		
	
endmodule