module qtz_reg_out(
	input  wire 					clk,
	input  wire 					nrst,
	input  wire 					mapping_hv_segment,
	input  wire 	[3:0]         	sel,
	input  wire 	[HV_DIM-1:0]  	im_fetch_outputs        [0:FEATURES_PER_CC-1],
	output logic	[HV_DIM-1:0]	level_hvs      			[0:FEATURE_COUNT-1] 
    ); 

    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for(int i = 0; i < FEATURE_COUNT; i++) begin
                level_hvs[i] <= '0;
            end        
        end    
        else if (mapping_hv_segment) begin
            case(sel) 
                4'd0: 	 level_hvs[0:61]    <= im_fetch_outputs;                       
                4'd1: 	 level_hvs[62:123]  <= im_fetch_outputs; 
                4'd2: 	 level_hvs[124:185] <= im_fetch_outputs;       
                4'd3: 	 level_hvs[186:247] <= im_fetch_outputs;
                4'd4: 	 level_hvs[248:309] <= im_fetch_outputs;                                              
                4'd5: 	 level_hvs[310:371] <= im_fetch_outputs;                                    
                4'd6: 	 level_hvs[372:433] <= im_fetch_outputs;  
                4'd7: 	 level_hvs[434:495] <= im_fetch_outputs; 
                4'd8:    level_hvs[496:557] <= im_fetch_outputs;
                default: level_hvs[558:616] <= im_fetch_outputs[0:58];                        
            endcase
        end 
        else begin
            level_hvs <= level_hvs;
        end
    end 

endmodule
