module qtz_reg_out_10(
	input  wire 					clk,
	input  wire 					nrst,
	input  wire 					mapping_hv_segment,
	input  wire 	         		qtz_out_reg_en,
	input  wire 	[HV_DIM-1:0]  	im_fetch_outputs        [0:FEATURES_PER_CC-1],
	output logic	[HV_DIM-1:0]	level_hvs      			[0:FEATURES_PER_CC-1] 
    ); 

    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for(int i = 0; i < FEATURES_PER_CC; i++) begin
                level_hvs[i] <= {HV_DIM{1'b0}};
            end        
        end    
        else if (mapping_hv_segment && qtz_out_reg_en) begin
            level_hvs <= im_fetch_outputs[0:58];
        end 
        else begin
            level_hvs <= level_hvs;
        end
    end 

endmodule