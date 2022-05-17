module oneshot_hdc_top(
    input  wire 		clk,
    input  wire 		nrst,
    input  wire 		en,
    input  wire 		start_mapping,
    input  wire [15:0] 	input_values [0:FEATURE_COUNT-1],
    input  wire [4:0] 	class_select_bits,
    input  wire 		training_dataset_finished,
    input  wire 		testing_dataset_finished,
    output wire [4:0] 	class_inference,
	output wire 		checking_inference,
    output wire 		oneshot_hdc_done
    );

	// Note: outputs tallying_accuracy and testing_hdc_model are only added for inference checking. We can remove this.
    
    // FSM Control Signals
    wire 				mapping_done;
    wire 				encoding_done;
    wire 				class_gen_done;
    wire 				training_hdc_model;
	wire 				testing_hdc_model;
        
    // Outputs Per Submodule
    wire [HV_DIM-1:0]   						level_hvs 		[0:FEATURE_COUNT-1]; 
    wire [HV_DIM-1:0]   						encoded_hv;   
    wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] bin_class_hvs	[0:25];

   
    // Main FSM Controller  
    oneshot_fsm FSM_TOP_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .start_mapping					(start_mapping),
		.class_gen_done					(class_gen_done),
        .training_dataset_finished		(training_dataset_finished),
        .testing_dataset_finished		(testing_dataset_finished),
        .training_hdc_model				(training_hdc_model),
        .testing_hdc_model				(testing_hdc_model),
        .oneshot_hdc_done				(oneshot_hdc_done)      
    );
    
    // Quantizer & Item Memory
    quantizing_top QTZ_TOP_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .start_mapping					(start_mapping),  
        .input_values					(input_values),
        .mapping_done					(mapping_done),
        .level_hvs						(level_hvs)     
    );
      
    // Binders & Bundlers
    encoding_top ENC_TOP_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .start_encoding					(mapping_done),
        .level_hvs						(level_hvs),
        .encoding_done					(encoding_done),    
        .encoded_hv						(encoded_hv)   
    ); 

    // Class HV Generator
    class_hv_gen_top CLASS_TOP_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .start_class_gen				(encoding_done & training_hdc_model),
		.training_hdc_model				(training_hdc_model),
        .training_dataset_finished		(training_dataset_finished),
        .encoded_hv						(encoded_hv),
        .class_select_bits				(class_select_bits),
        .bin_class_hvs					(bin_class_hvs),
        .class_gen_done					(class_gen_done)
    );
   
    // Associative Memory
    am_top AM_TOP_0(
        .clk							(clk),
        .nrst							(nrst),
        .en								(en),
        .start_querying					(encoding_done & testing_hdc_model),
        .testing_hdc_model				(testing_hdc_model),
        .testing_dataset_finished		(testing_dataset_finished),
        .encoded_hv						(encoded_hv),
        .binary_class_hvs				(bin_class_hvs),
		.tallying_accuracy				(checking_inference),
        .class_inference				(class_inference)
    );
	

endmodule
