module tb_encoder();
  reg [616:0][31:0]input_value;
  reg clk, en, nrst;
  wire [616:0][9:0]hv;
  
  Encoder UUT(
    .input_value(input_value),
    .clk(clk),
    .en(en),
    .nrst(nrst),
    .hv(hv)
  );
  
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
    
  clk = 0;
  en = 0;
    
  #1
  nrst = 1;
  en = 1;
// Scenario : > 0.8889
  input_value[0][31:0] = 32'b00111111100000000000000000000000; //1.0
  #1
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : 0.8889 > x > 0.66667
  input_value[0][31:0] = 32'b00111111001100110011001100110011; //0.7
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : 0.66667 > x > 0.44444
  input_value[0][31:0] = 32'b00111111000000000000000000000000; //0.5
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : 0.44444 > x > 0.22222
  input_value[0][31:0] = 32'b00111110100110011001100110011010; //0.3
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
  
// Scenario : 0.22222 > x > 0
  input_value[0][31:0] = 32'b00111101110011001100110011001101; //0.1
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : 0 > x > -0.22222
  input_value[0][31:0] = 32'b10111101110011001100110011001101; //-0.1
  #2
  clk = 1;
  $display("%b", hv[0][9:0]);
  #2
  clk = 0;
    
// Scenario : -0.22222 > x > -0.44444
  input_value[0][31:0] = 32'b10111110100110011001100110011010; //-0.3
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : -0.44444 > x > -0.66667
  input_value[0][31:0] = 32'b10111111000000000000000000000000; //-0.5
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : -0.66667 > x > -0.88889
  input_value[0][31:0] = 32'b10111111001100110011001100110011; //-0.7
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;
    
// Scenario : x < -0.88889
  input_value[0][31:0] = 32'b10111111100000000000000000000000; //-1.0
  #2
  clk = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk = 0;

// // Scenario : nrst goes down
  input_value[0][31:0] = 32'b10111111001100110011001100110011; //-0.7
  nrst = 0;
  #2
  clk=1;
  nrst = 1;
  #2
  $display("%b", hv[0][9:0]);
  clk=0;
    
// Scenario : enable is 0 when nrst is 1
  input_value = 32'b10111111100000000000000000000000; //-1.0
  en = 0;
  #2
  clk=1;
  #2
  $display("%b", hv[0][9:0]);
  clk=0;
  #2
  clk = 1;

  $finish;
  end
endmodule