`timescale 1ps / 1ps
`include "oneshot_hdc_top.sv"
`define CLK_PERIOD 10


module tb_oneshot_hdc_top();
    logic clk;
    logic nrst;
    logic en; 
    logic start_mapping;
    logic [15:0] input_values [0:FEATURE_COUNT-1];
    logic [4:0] class_select_bits;
    logic training_dataset_finished;
    logic testing_dataset_finished;
    wire [4:0] class_inference;
    wire [10:0] number_of_correct_inferences;
    wire oneshot_hdc_done;
    
    logic [15:0] fd [0:FEATURE_COUNT-1];


    oneshot_hdc_top ONE_SHOT_TOP(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_mapping(start_mapping),  
        .input_values(input_values),
        .class_select_bits(class_select_bits),
        .training_dataset_finished(training_dataset_finished),
        .testing_dataset_finished(testing_dataset_finished),
        .class_inference(class_inference),
        .number_of_correct_inferences(number_of_correct_inferences),
        .oneshot_hdc_done(oneshot_hdc_done)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
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
        for (int i = 0; i < FEATURE_COUNT; i++) begin
            input_values[i] = 0;
        end

        // enable
        #(`CLK_PERIOD/2)
        nrst = 1'b1;
        en = 1'b1;
 //__________________________________________________________________ Remove everything   
        
//        for (int i = 0; i < TRAINING_DATAPOINTS_COUNT; i++) begin 
//            class_select_bits = $urandom_range(0, 25);
//            if (i==0) begin
//                fd = $fopen("./sample_0.txt", "r");     
//                input_values[0] = fd;
//                $display(fd);
//                $fclose(fd);
//            end
//            else begin
//                for(int j = 0; j < FEATURE_COUNT; j++) begin
//                    input_values[j] = $urandom_range(0, 65535);              
//                end 
//            end
//            start_mapping = 1'b1;
//            #`CLK_PERIOD
//            start_mapping = 1'b0;
//            #(`CLK_PERIOD*11);   
//        end         
//        // BINARIZING CLASS HVS 
//        #(`CLK_PERIOD*23);
//        training_dataset_finished = 1'b1;               
//        #`CLK_PERIOD training_dataset_finished = 1'b0;      
//        #(`CLK_PERIOD*259)
 
 
 //___________________________________________________________________ Add everythign back    
        // TRAINING_DATA_SET           
        for(int i = 0; i < TRAINING_DATAPOINTS_COUNT; i++) begin
            class_select_bits = $urandom_range(0, 25);
            for(int j = 0; j < FEATURE_COUNT; j++) begin
                input_values[j] = $urandom_range(0, 65535);              
            end 
            start_mapping = 1'b1;
            #`CLK_PERIOD
            start_mapping = 1'b0;
            #(`CLK_PERIOD*11);   
        end         
        // BINARIZING CLASS HVS 
        #(`CLK_PERIOD*23);
        training_dataset_finished = 1'b1;               
        #`CLK_PERIOD training_dataset_finished = 1'b0;      
        #(`CLK_PERIOD*259)
            
              
        // TESTING_DATA_SET
        for(int i = 0; i < TESTING_DATAPOINTS_COUNT; i++) begin
            class_select_bits = $urandom_range(0, 25);
            for(int j = 0; j < FEATURE_COUNT; j++) begin
                input_values[j] = $urandom_range(0, 65535);              
            end 
            start_mapping = 1'b1;
            #`CLK_PERIOD
            start_mapping = 1'b0;
            #(`CLK_PERIOD*11);   
        end
        // Testing finished
        #(`CLK_PERIOD*23);
        testing_dataset_finished = 1'b1;
        #`CLK_PERIOD testing_dataset_finished = 1'b0;
           
        #(`CLK_PERIOD*5)
        $finish;

      end
      
endmodule
  

