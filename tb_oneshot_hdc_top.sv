`timescale 1ps / 1ps
`include "rtl/header.vh"
`include "rtl/header_shift_vals.vh"
`define CLK_PERIOD 10

module tb_oneshot_hdc_top();
    logic 			clk;
    logic 			nrst;
    logic 			en; 
	logic			start_hdc;
    logic 			start_mapping;
    logic 	[15:0] 	input_values 						[0:FEATURE_COUNT-1];
    logic 	[4:0] 	class_select_bits;
	logic 			start_binarizing;
    logic 			training_dataset_finished;
    logic 			testing_dataset_finished;
    wire 	[4:0] 	class_inference;
	wire			checking_inference;
	wire 			oneshot_hdc_done;

	// Accuracy Measurements
    logic 	[10:0]	number_of_correct_inferences;
	logic 	[4:0] 	correct_class_for_testing;
	logic			start_tallying;
	wire 			correct_inference;
     
	// Isolet
    logic 	[4:0] 	class_select_bits_train 			[0:TRAINING_DATAPOINTS_COUNT-1];
    logic 	[4:0] 	class_select_bits_test  			[0:TESTING_DATAPOINTS_COUNT-1];
	wire    [4:0] 	correct_class;
    
    string 			training_sample;
    string 			testing_sample;
	integer 		fd; 

    oneshot_hdc_top ONE_SHOT_TOP_0(
        .clk								(clk),
        .nrst								(nrst),
        .en									(en),
		.start_hdc							(start_hdc),
        .start_mapping						(start_mapping),  
        .input_values						(input_values),
        .class_select_bits					(class_select_bits),
		.start_binarizing					(start_binarizing),
        .training_dataset_finished			(training_dataset_finished),
        .testing_dataset_finished			(testing_dataset_finished),
        .class_inference					(class_inference),
		.checking_inference					(checking_inference),
        .oneshot_hdc_done					(oneshot_hdc_done)
    );

	// Clk
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end

	// Correct Inferences Counter; we can rmv this later and instead compare inferences.txt and test_Y.
	assign correct_class     = (start_tallying) 					? correct_class_for_testing : 5'b0;
	assign correct_inference = (class_inference == correct_class) 	? 1'b1 : 1'b0;	
    
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
        clk 						= 1'b0;
        nrst 						= 1'b0;
        en 							= 1'b0;
		start_hdc 					= 1'b0;
        start_mapping 				= 1'b0; 
        class_select_bits 			= '0;
		start_binarizing 			= 1'b0;
        training_dataset_finished 	= 1'b0; 
        testing_dataset_finished 	= 1'b0; 
        
		correct_class_for_testing 	= '0;
		start_tallying 				= 1'b0;  

		for(int i = 0; i < FEATURE_COUNT; i++) begin
            input_values[i] = '0;
        end

        // Store the letters of the isolet dataset
        $readmemb("./isolet/train_Y.mem", class_select_bits_train);
        $readmemb("./isolet/test_Y.mem" , class_select_bits_test);
       
        // Start
        #(`CLK_PERIOD/2);
        nrst = 1'b1;
        en = 1'b1;     

		// Some notes: Start_mapping is asserted every 12 clock cycles. This is the throughput of our model.

		// ------------------------------------------------------------ HDC MODEL TRAINING ------------------------------------------------------------	

		#`CLK_PERIOD;
		start_hdc = 1'b1;

		$readmemb("./isolet/training_samples/sample_0.mem", input_values);
        start_mapping = 1'b1;
        #`CLK_PERIOD;
		start_hdc = 1'b0;
        start_mapping = 1'b0;
        #(`CLK_PERIOD*11); 

 		$readmemb("./isolet/training_samples/sample_1.mem", input_values);
        start_mapping = 1'b1;
        #`CLK_PERIOD;
        start_mapping = 1'b0;
		#(`CLK_PERIOD*11); 

 		$readmemb("./isolet/training_samples/sample_2.mem", input_values);
        start_mapping = 1'b1;
        #`CLK_PERIOD;
        start_mapping = 1'b0;
		#(`CLK_PERIOD*11);

 		$readmemb("./isolet/training_samples/sample_3.mem", input_values);
        start_mapping = 1'b1;
        #`CLK_PERIOD;
        start_mapping = 1'b0;
        #(`CLK_PERIOD*9);  
		  
        for(int i = 4; i < TRAINING_DATAPOINTS_COUNT; i++) begin  
			#`CLK_PERIOD;
			// Note: as we start training for class X+1, we're simultaneously binarizing class X for 12 clock cycles.
			if (class_select_bits_train[i-2] != class_select_bits_train[i-3]) begin
				class_select_bits = class_select_bits_train[i-3];
				#`CLK_PERIOD;
				start_binarizing = 1'b1;				
			end	 
			else begin 
				#`CLK_PERIOD;
			end
								
            $sformat(training_sample, "./isolet/training_samples/sample_%0d.mem", i);           
            $readmemb(training_sample, input_values);

            start_mapping = 1'b1;

            #`CLK_PERIOD;
            start_mapping = 1'b0;
			start_binarizing = 1'b0;

            #(`CLK_PERIOD*9);
        end 
 
		#(`CLK_PERIOD*2);
		// Quantizing is finished. Start encoding the last sample.

		#(`CLK_PERIOD*11);
		// Encoding is finished. Start training using the last sample.

		#(`CLK_PERIOD*12);
		// Training the nonbin register for class 25 (Z) is finished. Start binarizing Z.

		class_select_bits = class_select_bits_train[TRAINING_DATAPOINTS_COUNT-1];
		#`CLK_PERIOD;
		start_binarizing = 1'b1;

		#`CLK_PERIOD;
		start_binarizing = 1'b0;

		#(`CLK_PERIOD*11);
		class_select_bits = '0;       
        training_dataset_finished = 1'b1;  
             
        #`CLK_PERIOD;
		training_dataset_finished = 1'b0;      

		$display("@%g Done training ...", $time);


        // ------------------------------------------------------------ HDC MODEL TESTING ------------------------------------------------------------

		// Write inferences to a text file
		fd = $fopen("oneshot_inferences.txt", "w");

		$readmemb("./isolet/testing_samples/test_sample_0.mem", input_values);

        start_mapping = 1'b1;

        #`CLK_PERIOD;
        start_mapping = 1'b0;

        #(`CLK_PERIOD*11);   
 		$readmemb("./isolet/testing_samples/test_sample_1.mem", input_values);
        start_mapping = 1'b1;

        #`CLK_PERIOD;
        start_mapping = 1'b0;

        #(`CLK_PERIOD*9);
		$display("@%g Start testing ...", $time);

		for(int i = 0; i < TESTING_DATAPOINTS_COUNT-2; i++) begin                   		

			#(`CLK_PERIOD*2);
			start_tallying = 1'b1;
			correct_class_for_testing = class_select_bits_test[i]; 
            $sformat(testing_sample,"./isolet/testing_samples/test_sample_%0d.mem",i+2);           
            $readmemb(testing_sample, input_values);           
            start_mapping = 1'b1;

            #`CLK_PERIOD;
            start_mapping = 1'b0;

            #(`CLK_PERIOD*9);  
			$fwrite(fd, class_inference);
			$fwrite(fd, "\n");
 
        end 

		// Overhead correct_class_for_testing assertion before testing ends
		#(`CLK_PERIOD*2);
		$fwrite(fd, class_inference);
		$fwrite(fd, "\n");
		correct_class_for_testing = class_select_bits_test[TESTING_DATAPOINTS_COUNT-2];

		#(`CLK_PERIOD*12);
		$fwrite(fd, class_inference);
		$fwrite(fd, "\n");
		correct_class_for_testing = class_select_bits_test[TESTING_DATAPOINTS_COUNT-1];

		#(`CLK_PERIOD*12);
		$fwrite(fd, class_inference);
		$fwrite(fd, "\n");
  
        // TESTING FINISHED
        start_tallying = 0;
        testing_dataset_finished = 1'b1;

        #`CLK_PERIOD 
		testing_dataset_finished = 1'b0;
		$fclose(fd);

		$display("----------------------------------------------");
		$display("@%g", $time);
		$display("Number of correct inferences: \t \t %d", number_of_correct_inferences);
		$display("Total number of queries made: \t %d", TESTING_DATAPOINTS_COUNT);
		$display("Accuracy: \t\t\t\t %f%", ((number_of_correct_inferences*100.00)/TESTING_DATAPOINTS_COUNT));	

        #`CLK_PERIOD;
        $finish;

      end
      
endmodule
  

