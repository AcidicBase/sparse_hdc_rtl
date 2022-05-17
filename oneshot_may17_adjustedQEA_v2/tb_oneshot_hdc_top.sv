`timescale 1ps / 1ps
`include "rtl/header.vh"
`include "rtl/header_shift_vals.vh"
`define CLK_PERIOD 10

module tb_oneshot_hdc_top();
    logic 			clk;
    logic 			nrst;
    logic 			en; 
    logic 			start_mapping;
    logic 	[15:0] 	input_values 						[0:FEATURE_COUNT-1];
    logic 	[4:0] 	class_select_bits;
    logic 			training_dataset_finished;
    logic 			testing_dataset_finished;

    wire 	[4:0] 	class_inference;
	wire			checking_inference;
	wire 			oneshot_hdc_done;

	// Accuracy Measurements
    logic 	[10:0]	number_of_correct_inferences;
	logic			start_tallying;
	wire 			correct_inference;
     
    logic 	[4:0] 	class_select_bits_train 			[0:TRAINING_DATAPOINTS_COUNT-1];
    logic 	[4:0] 	class_select_bits_test  			[0:TESTING_DATAPOINTS_COUNT-1];
	wire    [4:0] 	correct_class;
    
    string training_sample;
    string testing_sample;
	//integer fd; 

    oneshot_hdc_top ONE_SHOT_TOP_0(
        .clk								(clk),
        .nrst								(nrst),
        .en									(en),
        .start_mapping						(start_mapping),  
        .input_values						(input_values),
        .class_select_bits					(class_select_bits),
        .training_dataset_finished			(training_dataset_finished),
        .testing_dataset_finished			(testing_dataset_finished),
        .class_inference					(class_inference),
		.checking_inference					(checking_inference),
        .oneshot_hdc_done					(oneshot_hdc_done)
    );

    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end

	// Correct Inferences Counter
	assign correct_inference = (class_inference == correct_class) ? 1'b1 : 1'b0;
	assign correct_class     = (start_tallying) ? class_select_bits : 5'b0;
    
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            number_of_correct_inferences <= 0;
        end
        else if(checking_inference) begin
            number_of_correct_inferences <= number_of_correct_inferences + correct_inference;
        end
        else begin
            number_of_correct_inferences <= number_of_correct_inferences;
        end
    end

    
    initial begin 	
        // initialize
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0;
        start_mapping = 1'b0; 
        class_select_bits = 0;
        training_dataset_finished = 0; 
        testing_dataset_finished = 0; 
        
        for(int i = 0; i < FEATURE_COUNT; i++) begin
            input_values[i] = 0;
        end
   

        // store the letters of the isolet dataset
        $readmemb("isolet/train_Y.mem", class_select_bits_train);
        $readmemb("isolet/test_Y.mem", class_select_bits_test);
       
        // enable
        #(`CLK_PERIOD/2)
        nrst = 1'b1;
        en = 1'b1;       
        #`CLK_PERIOD

		// TRAINING CLASS HVS   
 		$readmemb("isolet/training_samples/sample_0.mem", input_values);

        start_mapping = 1'b1;
        #`CLK_PERIOD
        start_mapping = 1'b0;
        #(`CLK_PERIOD*11); 

 		$readmemb("isolet/training_samples/sample_1.mem", input_values);

        start_mapping = 1'b1;
        #`CLK_PERIOD
        start_mapping = 1'b0;
        #(`CLK_PERIOD*9);  
		
	        
        for(int i = 0; i < TRAINING_DATAPOINTS_COUNT-2; i++) begin       
            class_select_bits = class_select_bits_train[i]; 
            
			#(`CLK_PERIOD*2);

            $sformat(training_sample,"isolet/training_samples/sample_%0d.mem",i+2);           
            $readmemb(training_sample, input_values);
            
            start_mapping = 1'b1;
            #`CLK_PERIOD
            start_mapping = 1'b0;
            #(`CLK_PERIOD*9);   
        end 
		#(`CLK_PERIOD*2);

		$display("@%g Done training ...", $time);


		// overhead class_select_bits assertion before binarizing
		class_select_bits = class_select_bits_train[TRAINING_DATAPOINTS_COUNT-2];
		#(`CLK_PERIOD*12);
		class_select_bits = class_select_bits_train[TRAINING_DATAPOINTS_COUNT-1];
		#(`CLK_PERIOD*11);

		// Binarizing class hvs       
        training_dataset_finished = 1'b1;               
        #`CLK_PERIOD training_dataset_finished = 1'b0;      
        #(`CLK_PERIOD*259)

		$display("@%g Done binarizing ...", $time);


        // TESTING_DATA_SET

		// write inferences to a text file
		//fd = $fopen("oneshot_inferences.txt.", "w");

		$readmemb("isolet/testing_samples/test_sample_0.mem", input_values);

        start_mapping = 1'b1;
        #`CLK_PERIOD
        start_mapping = 1'b0;
        #(`CLK_PERIOD*11);   


 		$readmemb("isolet/testing_samples/test_sample_1.mem", input_values);

        start_mapping = 1'b1;
        #`CLK_PERIOD
        start_mapping = 1'b0;
        #(`CLK_PERIOD*9);

		$display("@%g Start testing ...", $time);

		for(int i = 0; i < TESTING_DATAPOINTS_COUNT-2; i++) begin                   		

			#(`CLK_PERIOD*2);
			start_tallying = 1;
			class_select_bits = class_select_bits_test[i]; 
            $sformat(testing_sample,"isolet/testing_samples/test_sample_%0d.mem",i+2);           
            $readmemb(testing_sample, input_values);           
            start_mapping = 1'b1;

            #`CLK_PERIOD
            start_mapping = 1'b0;
            #(`CLK_PERIOD*9);  

			//$fwrite(fd, class_inference);
			//$fwrite(fd, "\n");
 
        end 

		// overhead class_select_bits assertion before testing ends
		#(`CLK_PERIOD*2);
		//$fwrite(fd, class_inference);
		//$fwrite(fd, "\n");
		class_select_bits = class_select_bits_test[TESTING_DATAPOINTS_COUNT-2];
		#(`CLK_PERIOD*12);
		//$fwrite(fd, class_inference);
		//$fwrite(fd, "\n");
		class_select_bits = class_select_bits_test[TESTING_DATAPOINTS_COUNT-1];
		#(`CLK_PERIOD*12);
		//$fwrite(fd, class_inference);
		//$fwrite(fd, "\n");

      
        // TESTING FINISHED
        start_tallying = 0;
        testing_dataset_finished = 1'b1;
        #`CLK_PERIOD testing_dataset_finished = 1'b0;
		$display("----------------------------------------------");
		$display("@%g", $time);
		$display("Number of correct inferences: \t \t %d", number_of_correct_inferences);
		$display("Total number of queries made: \t %d", TESTING_DATAPOINTS_COUNT);
		$display("Accuracy: \t\t\t\t %f%", ((number_of_correct_inferences*100.00)/TESTING_DATAPOINTS_COUNT));
		
     	//$fclose(fd);

        #(`CLK_PERIOD*5)
        $finish;

      end
      
endmodule
  

