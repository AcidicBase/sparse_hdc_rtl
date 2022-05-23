module am_mux_in(
	input  	wire							testing_hdc_model,
	input 	wire 	[3:0] 				 	query_ctr,
	input   wire 	[HV_DIM-1:0] 			encoded_hv,
	output 	logic 	[DIMS_PER_CC-1:0] 		query_hv_segment
	);   

	wire [HV_DIM-1:0] query_hv;

	assign query_hv = (testing_hdc_model) ? encoded_hv : '0;

    always_comb begin
	    case(query_ctr)
			4'd0:    query_hv_segment = query_hv[499:0];
	        4'd1:    query_hv_segment = query_hv[999:500];
	        4'd2:    query_hv_segment = query_hv[1499:1000];
	        4'd3:    query_hv_segment = query_hv[1999:1500];
	        4'd4:    query_hv_segment = query_hv[2499:2000];
	        4'd5:    query_hv_segment = query_hv[2999:2500];
	        4'd6:    query_hv_segment = query_hv[3499:3000];
	        4'd7:    query_hv_segment = query_hv[3999:3500];
	        4'd8:    query_hv_segment = query_hv[4499:4000];
	        default: query_hv_segment = query_hv[4999:4500];
	    endcase
    end  

endmodule
