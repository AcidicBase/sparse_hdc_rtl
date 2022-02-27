module tb_quantizer();
  reg [31:0]unquantized;
  reg en, nrst;
//   reg [9:0]output_id;
  wire [3:0]quantized;
  
  
  Quantizer UUT(
    .input_value(unquantized),
    .quantized_value_level(quantized),
    .nrst(nrst),
    .en(en)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    en = 0;
    
    #1
    nrst = 1;
    en = 1;
// Scenario : > 0.8889
    unquantized = 32'b00111111100000000000000000000000; //1.0
    #1
    
// Scenario : 0.8889 > x > 0.66667
    unquantized = 32'b00111111001100110011001100110011; //0.7
    #2
    
// Scenario : 0.66667 > x > 0.44444
    unquantized = 32'b00111111000000000000000000000000; //0.5
    #2
    
// Scenario : 0.44444 > x > 0.22222
    unquantized = 32'b00111110100110011001100110011010; //0.3
    #2
  
// Scenario : 0.22222 > x > 0
    unquantized = 32'b00111101110011001100110011001101; //0.1
    #2
    
// Scenario : 0 > x > -0.22222
    unquantized = 32'b10111101110011001100110011001101; //-0.1
    #2
    
// Scenario : -0.22222 > x > -0.44444
    unquantized = 32'b10111110100110011001100110011010; //-0.3
    #2
    
// Scenario : -0.44444 > x > -0.66667
    unquantized = 32'b10111111000000000000000000000000; //-0.5
    #2
    
// Scenario : -0.66667 > x > -0.88889
    unquantized = 32'b10111111001100110011001100110011; //-0.7
    #2

// Scenario : x < -0.88889
    unquantized = 32'b10111111100000000000000000000000; //-1.0
    #2

// // Scenario : nrst goes down
    unquantized = 32'b10111111001100110011001100110011; //-0.7
    nrst = 0;
    #2
    nrst = 1;
    
// Scenario : enable is 0 when nrst is 1
	unquantized = 32'b10111111100000000000000000000000; //-1.0
    en = 0;
    #2

    $finish;
  end
endmodule