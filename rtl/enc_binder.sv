module enc_binder(
    input  wire  	[HV_DIM-1:0] 	level_hv,
    output wire		[HV_DIM-1:0] 	shifted_hv
);

	// default shift value (signature)
    parameter SHIFT = 1; 

	assign shifted_hv = {level_hv[SHIFT-1:0], level_hv[HV_DIM-1:SHIFT]};              
  
  
endmodule
