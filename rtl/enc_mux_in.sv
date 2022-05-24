module enc_mux_in(
	input 	wire 	[3:0] 				 	ctr,
	input 	wire 	[FEATURE_COUNT-1:0] 	mux_in		[SEQ_CYCLE_COUNT-1:0],
	output 	logic 	[FEATURE_COUNT-1:0] 	mux_out
	);   

    always_comb begin
        case(ctr)
			4'd0:    mux_out = mux_in[0];
            4'd1:    mux_out = mux_in[1];
            4'd2:    mux_out = mux_in[2];
            4'd3:    mux_out = mux_in[3];
            4'd4:    mux_out = mux_in[4];
            4'd5:    mux_out = mux_in[5];
            4'd6:    mux_out = mux_in[6];
            4'd7:    mux_out = mux_in[7];
            4'd8:    mux_out = mux_in[8];
            4'd9:    mux_out = mux_in[9];
			default: mux_out = '0;
        endcase
    end 

endmodule
