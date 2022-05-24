module qtz_mux_in(
	input  wire  [3:0]		sel,
	input  wire  [15:0]     input_values 	[0:FEATURE_COUNT-1],
	output logic [15:0]		mux_out         [0:FEATURES_PER_CC-1]
    );  

	always_comb begin
        case(sel)
            4'd0:    mux_out = input_values[0:61];
            4'd1:    mux_out = input_values[62:123];
            4'd2:    mux_out = input_values[124:185];
            4'd3:    mux_out = input_values[186:247];
            4'd4:    mux_out = input_values[248:309];
            4'd5:    mux_out = input_values[310:371];
            4'd6:    mux_out = input_values[372:433];
            4'd7:    mux_out = input_values[434:495];
            4'd8:    mux_out = input_values[496:557];
            default: begin
					    mux_out[0:58] = input_values[558:616];  // mux_out = '{input_values[558:616], 0, 0, 0}
					 	mux_out[59:61] = '{0, 0, 0};
          	     	 end
        endcase
    end 

endmodule
