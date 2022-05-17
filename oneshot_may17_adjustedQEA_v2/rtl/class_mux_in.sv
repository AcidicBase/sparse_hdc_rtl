module class_mux_in(
	input  wire							training_hdc_model,
	input  wire   	[3:0] 				nonbin_ctr,
	input  wire   	[HV_DIM-1:0] 		encoded_hv,
	output logic	[DIMS_PER_CC-1:0] 	input_hv_chunk
	);

	wire [HV_DIM-1:0] training_hv;

	assign training_hv  = (training_hdc_model) ? encoded_hv : {HV_DIM{1'b0}};

    always_comb begin
	    case(nonbin_ctr)
			4'd0:    input_hv_chunk = training_hv[499:0];
	        4'd1:    input_hv_chunk = training_hv[999:500];
	        4'd2:    input_hv_chunk = training_hv[1499:1000];
	        4'd3:    input_hv_chunk = training_hv[1999:1500];
	        4'd4:    input_hv_chunk = training_hv[2499:2000];
	        4'd5:    input_hv_chunk = training_hv[2999:2500];
	        4'd6:    input_hv_chunk = training_hv[3499:3000];
	        4'd7:    input_hv_chunk = training_hv[3999:3500];
	        4'd8:    input_hv_chunk = training_hv[4499:4000];
	        default: input_hv_chunk = training_hv[4999:4500];
	    endcase
    end 

endmodule
