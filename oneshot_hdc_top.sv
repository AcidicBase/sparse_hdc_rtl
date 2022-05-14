`include "header.vh"
`include "oneshot_fsm.sv"
`include "quantizing_top.sv"
`include "encoding_top.sv"
`include "class_hv_gen_top.sv"
`include "am_top.sv"

module oneshot_hdc_top(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_mapping,
    input wire [15:0] input_values [0:FEATURE_COUNT-1],
    input wire [4:0] class_select_bits,
    input wire training_dataset_finished,
    input wire testing_dataset_finished,
    output wire [4:0] class_inference,
    output wire [10:0] number_of_correct_inferences,
    output wire oneshot_hdc_done
    );
    
    // control signals
    wire mapping_done;
    wire encoding_done;
    wire class_gen_done;
    wire training_hdc_model;
    wire testing_hdc_model;
    
    // submodule outputs
    wire [HV_DIM-1:0] level_hvs [0:FEATURE_COUNT-1]; 
    wire [HV_DIM-1:0] encoded_hv;   
    wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] bin_class_hvs [0:25];
    
	// train/test
	wire [HV_DIM-1:0] training_hv;
	wire [4:0] training_class_select_bits;

	wire [HV_DIM-1:0] query_hv;
	wire [4:0] correct_class;

   
    // main fsm  
    oneshot_fsm HDC_FSM1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_mapping(start_mapping),
		.class_gen_done(class_gen_done),
        .training_dataset_finished(training_dataset_finished),
        .testing_dataset_finished(testing_dataset_finished),
        .training_hdc_model(training_hdc_model),
        .testing_hdc_model(testing_hdc_model),
        .oneshot_hdc_done(oneshot_hdc_done)      
    );
    
    // quantizer & item memory
    mapping_top QUANTIZING1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_mapping(start_mapping),  
        .input_values(input_values),
        .mapping_done(mapping_done),
        .level_hvs(level_hvs)     
    );
      
    // binders & bundlers
    encoding_top ENCODING1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_encoding(mapping_done),
        .level_hvs(level_hvs),
        .encoding_done(encoding_done),    
        .encoded_hv(encoded_hv)   
    ); 

    // class hv generator
    class_hv_gen_top CLASS_GEN1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_class_gen(encoding_done & training_hdc_model),
		.training_hdc_model(training_hdc_model),
        .training_dataset_finished(training_dataset_finished),
        .encoded_hv(training_hv),
        .class_select_bits(training_class_select_bits),
        .bin_class_hvs(bin_class_hvs),
        .class_gen_done(class_gen_done)
    );

	assign training_hv                = (training_hdc_model) ? encoded_hv : 5000'b0;
	assign training_class_select_bits = (training_hdc_model) ? class_select_bits : 5'b0;
   
    // associative memory
    am_top ASSOC_MEM1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_querying(encoding_done & testing_hdc_model),
        .testing_hdc_model(testing_hdc_model),
        .testing_dataset_finished(testing_dataset_finished),
        .query_hv(query_hv),
        .binary_class_hvs(bin_class_hvs),
        .correct_class(correct_class),
        .class_inference(class_inference),
        .number_of_correct_inferences(number_of_correct_inferences) 
    );

	assign query_hv                  = (testing_hdc_model) ? encoded_hv : 5000'b0;
    assign correct_class             = (testing_hdc_model) ? class_select_bits : 5'b0;

endmodule
