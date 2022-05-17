module class_hv_gen_top(
    input  wire  										clk,
    input  wire  										nrst,
    input  wire  										en,
    input  wire  										start_class_gen,
	input  wire  										training_hdc_model,
    input  wire  										training_dataset_finished,  
    input  wire [HV_DIM-1:0] 							encoded_hv,
    input  wire [4:0] 									class_select_bits,
    output wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] 	bin_class_hvs [0:25],
    output wire 										class_gen_done
    );
    
    // FSM internal signals
    wire [3:0] 	nonbin_ctr;
    wire [3:0] 	bin_ctr;
    wire [3:0] 	class_hv_gen_ctr;
    wire [4:0] 	binarized_class_counter;
    wire 		adjusting_nonbin_class_hvs;
    wire 		binarizing_class_hvs;
    
    // Bundler input signals
    wire [DIMS_PER_CC-1:0] 							input_hv_chunk;
	wire  [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	stored_hv_chunk;
    
    // nonbinary_class_reg input signals
	wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	nonbin_class_reg_out;
    wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	nonbin_class_reg_in;
	wire [4:0] 										nonbin_class_select_bits;
    
	// class_thresholder input signal
	wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	class_thresholder_in;

    // binary_class_reg input signal
    wire [DIMS_PER_CC-1:0] 							bin_class_reg_in;

	// class select output
	wire [4:0]										training_class_select_bits;
    
    // FSM Controller
    class_fsm C_FSM_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .start_class_gen				(start_class_gen),
        .training_dataset_finished		(training_dataset_finished),
        .nonbin_ctr						(nonbin_ctr),
        .bin_ctr						(bin_ctr),
        .class_hv_gen_ctr				(class_hv_gen_ctr),
        .binarized_class_counter		(binarized_class_counter),
        .adjusting_nonbin_class_hvs		(adjusting_nonbin_class_hvs),
        .binarizing_class_hvs			(binarizing_class_hvs),
        .class_gen_done					(class_gen_done)
    );

	// Class Mux In
    class_mux_in C_MUX_IN_0(
		.training_hdc_model				(training_hdc_model),
		.nonbin_ctr						(nonbin_ctr),
		.encoded_hv						(encoded_hv),
		.input_hv_chunk					(input_hv_chunk)
	);

    // Class Bundler
    class_bundler C_BUNDLE_0(
        .input_hv_chunk					(input_hv_chunk),
        .stored_hv_chunk				(stored_hv_chunk),
        .sum							(nonbin_class_reg_in)
    );	

	// Class Mux Out	
	class_mux_out C_MUX_OUT_0(
		.training_hdc_model				(training_hdc_model),
	    .binarizing_class_hvs			(binarizing_class_hvs),
        .nonbin_class_reg_out			(nonbin_class_reg_out),
		.stored_hv_chunk				(stored_hv_chunk),
		.class_thresholder_in			(class_thresholder_in)
	);

	// Class Select
	class_select C_SELECT_0(
		.training_hdc_model				(training_hdc_model),
		.binarizing_class_hvs			(binarizing_class_hvs),
        .binarized_class_counter		(binarized_class_counter),
		.class_select_bits				(class_select_bits),
		.training_class_select_bits		(training_class_select_bits),
		.nonbin_class_select_bits		(nonbin_class_select_bits)
	);
    
    // Class Thresholder
    class_thresholder C_THR_0(
        .class_thresholder_in			(class_thresholder_in),
        .thresholded_hv					(bin_class_reg_in)
    );
 	
    // Nonbinary Class Registers
    class_reg_nonbin C_REG_NONBIN_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .adjusting_nonbin_class_hvs		(adjusting_nonbin_class_hvs),
        .training_class_select_bits		(training_class_select_bits),
		.nonbin_class_select_bits		(nonbin_class_select_bits),
        .nonbin_ctr						(nonbin_ctr),
        .class_hv_gen_ctr				(class_hv_gen_ctr),
        .nonbin_class_reg_in			(nonbin_class_reg_in),
        .nonbin_class_reg_out			(nonbin_class_reg_out)
    );
    
    // Binary Class Registers
    class_reg_bin C_REG_BIN_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .binarizing_class_hvs			(binarizing_class_hvs),
        .binarized_class_counter		(binarized_class_counter),
        .bin_ctr						(bin_ctr),
        .bin_class_reg_in				(bin_class_reg_in),
        .bin_class_hvs					(bin_class_hvs)
    );
    
endmodule
