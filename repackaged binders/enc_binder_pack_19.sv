module enc_binder_pack_19(
    input  wire  					clk,
    input  wire  					nrst,
    input  wire  					start_encoding,
    input  wire  	[HV_DIM-1:0] 	level_hv		[0:((FEATURES_PER_CC/2)-4)], // 589 to 616
    output logic	[HV_DIM-1:0] 	shifted_hv		[0:((FEATURES_PER_CC/2)-4)]
);
                      
    for (genvar i = 0; i < ((FEATURES_PER_CC/2)-3); i++) 
		begin : binders
			enc_binder #(.SHIFT(SHIFTS[589+i]))
			ENC_BINDER(
			    .clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
			    .level_hv						(level_hv[i]),
			    .shifted_hv						(shifted_hv[i])
			);
    	end
			
endmodule