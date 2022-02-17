module tb_float32_comparator();
  reg [31:0] a;
  reg [31:0] b;
  wire [1:0] x;
  
  FLOAT32_Comparator UUT(
    .input_value(a),
    .compared_value(b),
    .result(x)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);

    $display("FLOAT32 Comparator Test Bench...");
    // Scenario : Equal
    a = 32'b10111110110111101001111000011011; //-0.4348
    b = 32'b10111110110111101001111000011011;
    #10
    $display("Equal %d Expected: ",x, 0);
    
    // Scenario : Equal negative sign, exp, diff mantissa (a<b)
    a = 32'b10111110111111111111111111111111; //-0.499
    b = 32'b10111110110111101001111000011011; //-0.4348
    #10
    $display("Equal sign,exp, diff mantissa %d , Expected: ", x, 1);
    
    // Scenario : Equal negative sign, exp, diff mantissa (a>b)
    a = 32'b10111110110111101001111000011011; //-0.4348
    b = 32'b10111110111111111111111111111111; //-0.499
    #10
    $display("Equal sign,exp, diff mantissa %d , Expected: ", x, 2);
    
    // Scenario : Equal positive sign, exp, diff mantissa (a>b)
    a = 32'b00111110111111111111111111111111; //0.499
    b = 32'b00111110110111101001111000011011; //0.4348
    #10
    $display("Equal sign,exp, diff mantissa %d , Expected: ", x, 2);
    
    // Scenario : Equal positive sign, exp, diff mantissa (a<b)
    a = 32'b00111110110111101001111000011011; //0.4348
    b = 32'b00111110111111111111111111111111; //0.499
    #10
    $display("Equal sign,exp, diff mantissa %d , Expected: ", x, 1);
    
    // Scenario : Equal positive sign, diff exponent and mantissa (a>b)
    a = 32'b00111111011111111111111111111100; //0.99
    b = 32'b00111110011111111101111111111100; //0.25
    #10
    $display("Equal positive sign, diff exp & mantissa %d , Expected: ", x, 2);
    
    // Scenario : Equal positive sign, diff exponent and mantissa (a<b)
    a = 32'b00111110011111111101111111111100; //0.25
    b = 32'b00111111011111111111111111111100; //0.99
    #10
    $display("Equal positive sign, diff exp & mantissa %d , Expected: ", x, 1);
    
    // Scenario : Equal negative sign, diff exponent and mantissa (a<b)
    a = 32'b10111111011111111111111111111100; //-0.99
    b = 32'b10111110011111111101111111111100; //-0.25
    #10
    $display("Equal negative sign, diff exp & mantissa %d , Expected: ", x, 1);
    
    // Scenario : Equal negative sign, diff exponent and mantissa (a>b)
    a = 32'b10111110011111111101111111111100; //-0.25
    b = 32'b10111111011111111111111111111100; //-0.99
    #10
    $display("Equal negative sign, diff exp & mantissa %d , Expected: ", x, 2);
    
    // Scenario: A is negative, B is positive
    a = 32'b10111111011111111111111111111100; //-0.99
    b = 32'b00111111011111111111111111111100; //0.99
    #10
    $display("A neg, B pos %d , Expected: %d", x, 1);
    
    // Scenario: A is positive, B is negative
    a = 32'b00111111011111111111111111111100; //0.99
    b = 32'b10111111011111111111111111111100; //-0.99
    #10
    $display("A pos, B neg %d , Expected: %d", x, 2);
    $finish;
  end

endmodule