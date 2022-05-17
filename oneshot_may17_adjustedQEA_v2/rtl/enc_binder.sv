module enc_binder(
    input  wire  					clk,
    input  wire  					nrst,
    input  wire  					start_binding,
    input  wire  	[HV_DIM-1:0] 	level_hv,
    output logic	[HV_DIM-1:0] 	shifted_hv
);

	// default shift value (signature)
    parameter SHIFT = 1;     
                     

    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            shifted_hv <= {HV_DIM{1'b0}};
        end
        else if (start_binding) begin
            shifted_hv <= {level_hv[SHIFT-1:0], level_hv[HV_DIM-1:SHIFT]};
        end
        else begin
            shifted_hv <= shifted_hv;
        end
    end

endmodule
