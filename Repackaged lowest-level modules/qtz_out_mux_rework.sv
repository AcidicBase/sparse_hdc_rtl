module qtz_out_mux(
	input  wire 	[3:0]         	sel,
	output logic	[9:0]			qtz_out_reg_en 
    ); 
/*
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for(int i = 0; i < FEATURE_COUNT; i++) begin
                level_hvs[i] <= {HV_DIM{1'b0}};
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
*/
	always_comb
		case(sel)
				4'd0: 	 qtz_out_reg_en = 10'b0000000001;                       
                4'd1: 	 qtz_out_reg_en = 10'b0000000010; 
                4'd2: 	 qtz_out_reg_en = 10'b0000000100;       
                4'd3: 	 qtz_out_reg_en = 10'b0000001000;
                4'd4: 	 qtz_out_reg_en = 10'b0000010000;                                              
                4'd5: 	 qtz_out_reg_en = 10'b0000100000;                                    
                4'd6: 	 qtz_out_reg_en = 10'b0001000000; 
                4'd7: 	 qtz_out_reg_en = 10'b0010000000; 
                4'd8:    qtz_out_reg_en = 10'b0100000000;
                default: qtz_out_reg_en = 10'b1000000000;
		endcase

endmodule