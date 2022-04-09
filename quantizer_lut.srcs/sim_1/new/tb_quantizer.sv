`timescale 1ps / 1ps

module tb_quantizer();
    logic en;
    logic nrst;  
    logic [15:0]unquantized;
    wire [3:0]quantized;   
    
  quantizer Q1(
    .en(en),
    .nrst(nrst),
    .input_value(unquantized),
    .quantized_value_level(quantized)  
  );
  
  initial begin
    nrst = 0;
    en = 0;
    
    #1
    en = 1;
    nrst = 1;
// Scenario : > 0.88889
    unquantized = 16'b0010011100010000; //1.0 (10000)
    $display("%d", $signed(unquantized));
    #2
    
// Scenario : 0.8889 > x > 0.66667
    unquantized = 16'b0001101101011000; //0.7 (7000)
    #2
    
// Scenario : 0.66667 > x > 0.44444
    unquantized = 16'b0001001110001000; //0.5 (5000)
    #2
    
// Scenario : 0.44444 > x > 0.22222
    unquantized = 16'b0000101110111000; //0.3 (3000)
    #2
  
// Scenario : 0.22222 > x > 0
    unquantized = 16'b0000001111101000; //0.1 (1000)
    #2
    
// Scenario : 0 > x > -0.22222
    unquantized = 16'b1111110000011000; //-0.1
    #2
    
// Scenario : -0.22222 > x > -0.44444
    unquantized = 16'b1111010001001000; //-0.3
    #2
    
// Scenario : -0.44444 > x > -0.66667
    unquantized = 16'b1110110001111000; //-0.5
    #2
    
// Scenario : -0.66667 > x > -0.88889
    unquantized = 16'b1110010010101000; //-0.7
    #2

// Scenario : x < -0.88889
    unquantized = 16'b1101100011110000; //-1.0
    #2

// Scenario : nrst goes down
    unquantized = 16'b1110010010101000; //-0.7
    nrst = 0;
    #2
    nrst = 1;
    
// Scenario : enable is 0 when nrst is 1
    en = 0;
	unquantized = 16'b1101100011110000; //-1.0
    #2

    $finish;
  end
endmodule