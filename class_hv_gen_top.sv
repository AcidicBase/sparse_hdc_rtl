`include "class_bundler.sv"
`include "class_thresholder.sv"
`include "class_fsm.sv"
`include "class_reg_nonbin.sv"
`include "class_reg_bin.sv"

module class_hv_gen_top(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_class_gen,
	input wire training_hdc_model,
    input wire training_dataset_finished,  
    input wire [HV_DIM-1:0] encoded_hv,
    input wire [4:0] class_select_bits,
    output wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] bin_class_hvs [0:25],
    output wire class_gen_done
    );
    
    // FSM internal signals
    wire [3:0] nonbin_ctr;
    wire [3:0] bin_ctr;
    wire [3:0] class_hv_gen_ctr;
    wire [4:0] binarized_class_counter;
    wire adjusting_nonbin_class_hvs;
    wire binarizing_class_hvs;
    
    // Bundler input signals
    logic [DIMS_PER_CC-1:0] input_hv_chunk;
	wire  [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] stored_hv_chunk;
    
    // nonbinary_class_reg input signals
	wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_out;
    wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_in;
	wire  [4:0] nonbin_class_select_bits;
    
	// class_thresholder input signal
	wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] class_thresholder_in;

    // binary_class_reg input signal
    wire [DIMS_PER_CC-1:0] bin_class_reg_in;

    
    // instantiate fsm
    class_fsm C_FSM_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_class_gen(start_class_gen),
        .training_dataset_finished(training_dataset_finished),
        .nonbin_ctr(nonbin_ctr),
        .bin_ctr(bin_ctr),
        .class_hv_gen_ctr(class_hv_gen_ctr),
        .binarized_class_counter(binarized_class_counter),
        .adjusting_nonbin_class_hvs(adjusting_nonbin_class_hvs),
        .binarizing_class_hvs(binarizing_class_hvs),
        .class_gen_done(class_gen_done)
    );
    
    // instantiate class_bundler
    class_bundler C_BUNDLE_1(
        .input_hv_chunk(input_hv_chunk),
        .stored_hv_chunk(stored_hv_chunk),
        .sum(nonbin_class_reg_in)
    );		
    
    // instantiate class_thresholder
    class_thresholder C_THR_1(
        .class_thresholder_in(class_thresholder_in),
        .thresholded_hv(bin_class_reg_in)
    );
 	
    // instantiate nonbinary_class_reg
    class_reg_nonbin NONBIN_CLASS_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .adjusting_nonbin_class_hvs(adjusting_nonbin_class_hvs),
        .class_select_bits(class_select_bits),
		.nonbin_class_select_bits(nonbin_class_select_bits),
        .nonbin_ctr(nonbin_ctr),
        .class_hv_gen_ctr(class_hv_gen_ctr),
        .nonbin_class_reg_in(nonbin_class_reg_in),
        .nonbin_class_reg_out(nonbin_class_reg_out)
    );
    
    // instantiate binary_class_reg
    class_reg_bin BIN_CLASS_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .binarizing_class_hvs(binarizing_class_hvs),
        .binarized_class_counter(binarized_class_counter),
        .bin_ctr(bin_ctr),
        .bin_class_reg_in(bin_class_reg_in),
        .bin_class_hvs(bin_class_hvs)
    );

	// controlled inputs
	assign stored_hv_chunk      = (training_hdc_model)   ? nonbin_class_reg_out : {DIMS_PER_CC{1'b0}};
    assign class_thresholder_in = (binarizing_class_hvs) ? nonbin_class_reg_out : {DIMS_PER_CC{1'b0}};

    // input mux
    always_comb begin
	    case(nonbin_ctr)
			4'd0:    input_hv_chunk = encoded_hv[499:0];
	        4'd1:    input_hv_chunk = encoded_hv[999:500];
	        4'd2:    input_hv_chunk = encoded_hv[1499:1000];
	        4'd3:    input_hv_chunk = encoded_hv[1999:1500];
	        4'd4:    input_hv_chunk = encoded_hv[2499:2000];
	        4'd5:    input_hv_chunk = encoded_hv[2999:2500];
	        4'd6:    input_hv_chunk = encoded_hv[3499:3000];
	        4'd7:    input_hv_chunk = encoded_hv[3999:3500];
	        4'd8:    input_hv_chunk = encoded_hv[4499:4000];
	        default: input_hv_chunk = encoded_hv[4999:4500];
	    endcase
    end 

	// select bits of nonbinary class mux
	assign nonbin_class_select_bits = (binarizing_class_hvs == 1'b1) ? binarized_class_counter : class_select_bits;

    
endmodule
