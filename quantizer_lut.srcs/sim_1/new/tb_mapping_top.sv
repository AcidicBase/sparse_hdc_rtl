`timescale 1ps / 1ps
`include "mapping_top.sv"

module tb_mapping_top();
    logic clk;
    logic nrst;
    logic en;
    logic start_mapping;
    logic [15:0] input_values [0:FEATURE_COUNT-1];
    wire mapping_done;
    wire [HV_DIM-1:0] level_hvs [0:FEATURE_COUNT-1];

    mapping_top MAP1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_mapping(start_mapping),  
        .input_values(input_values),
        .mapping_done(mapping_done),
        .level_hvs(level_hvs)     
    );
    
    always begin
        #50 clk = ~clk;
    end
    
    initial begin
 
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0;
        start_mapping = 1'b0;
        
        for (int i = 0; i < FEATURE_COUNT; i++) begin
            input_values[i] = 0;
        end
        
        #25  nrst = 1'b1;
        #75  en = 1'b1;
        #50 
 
        start_mapping = 1;
        // Input 1
             
        // Scenario : > 0.88889
        input_values[0] = 16'b0001101101011000; //0.7 (7000)
        input_values[1] = 16'b0001101101011000; //0.7 (7000)
        input_values[2] = 16'b0001101101011000; //0.7 (7000)
        input_values[3] = 16'b0001101101011000; //0.7 (7000)
        
        // Scenario : 0.8889 > x > 0.66667
        input_values[4] = 16'b0001001110001000; //0.5 (5000)
        input_values[5] = 16'b0001001110001000; //0.5 (5000)
        input_values[6] = 16'b0001001110001000; //0.5 (5000)
        input_values[7] = 16'b0001001110001000; //0.5 (5000)
    
        // Scenario : 0.66667 > x > 0.44444
        input_values[8]  = 16'b0000101110111000; //0.3 (3000)
        input_values[9]  = 16'b0000101110111000; //0.3 (3000)
        input_values[10] = 16'b0000101110111000; //0.3 (3000)
        input_values[11] = 16'b0000101110111000; //0.3 (3000)
    
        // Scenario : 0.44444 > x > 0.22222
        input_values[12] = 16'b0000001111101000; //0.1 (1000)
        input_values[13] = 16'b0000001111101000; //0.1 (1000)
        input_values[14] = 16'b0000001111101000; //0.1 (1000)
        input_values[15] = 16'b0000001111101000; //0.1 (1000)
    
      // Scenario : 0.22222 > x > 0
        input_values[16] = 16'b1111110000011000; //-0.1
        input_values[17] = 16'b1111110000011000; //-0.1
        input_values[18] = 16'b1111110000011000; //-0.1
        input_values[19] = 16'b1111110000011000; //-0.1
        
      // Scenario : 0 > x > -0.22222
        input_values[20] = 16'b1111010001001000; //-0.3
        input_values[21] = 16'b1111010001001000; //-0.3
        input_values[22] = 16'b1111010001001000; //-0.3
        input_values[23] = 16'b1111010001001000; //-0.3
    
      // Scenario : -0.22222 > x > -0.44444
        input_values[24] = 16'b1110110001111000; //-0.5
        input_values[25] = 16'b1110110001111000; //-0.5
        input_values[26] = 16'b1110110001111000; //-0.5
        input_values[27] = 16'b1110110001111000; //-0.5
    
      // Scenario : -0.44444 > x > -0.66667
        input_values[28] = 16'b1110010010101000; //-0.7
        input_values[29] = 16'b1110010010101000; //-0.7
        input_values[30] = 16'b1110010010101000; //-0.7
        input_values[31] = 16'b1110010010101000; //-0.7
    
      // Scenario : -0.66667 > x > -0.88889
        input_values[32] = 16'b1101100011110000; //-1.0
        input_values[33] = 16'b1101100011110000; //-1.0
        input_values[34] = 16'b1101100011110000; //-1.0
        input_values[35] = 16'b1101100011110000; //-1.0
    
      // Scenario : x < -0.88889
        input_values[36] = 16'b1110010010101000; //-0.7
        input_values[37] = 16'b1110010010101000; //-0.7
        input_values[38] = 16'b1110010010101000; //-0.7
        input_values[39] = 16'b1110010010101000; //-0.7
        
        #100 start_mapping = 1'b0;
        #1250 en = 1'b0;
        
        #50 
        $finish;

      end
      
endmodule
  

