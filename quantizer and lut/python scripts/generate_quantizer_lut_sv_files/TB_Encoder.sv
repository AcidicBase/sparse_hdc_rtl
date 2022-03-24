
  module tb_encoder();
  reg [3:0][15:0]input_value;
  reg clk, en, nrst;
  reg S_QTZ;
  wire [39:0][63:0]hv;
  
  Encoder UUT(
    .input_value(input_value),
    .S_QTZ(S_QTZ),
    .clk(clk),
    .en(en),
    .nrst(nrst),
    .hv(hv)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    clk = 0;
    en = 1;
    nrst = 0;
    S_QTZ = 0;

    #1
    clk = 1;
    nrst = 1;
    #1
    clk = 0;
    input_value[0][15:0] = 16'b0010011100010000; //1.0 (10000)
    input_value[1][15:0] = 16'b0010011100010000; //1.0 (10000)
    input_value[2][15:0] = 16'b0010011100010000; //1.0 (10000)
    input_value[3][15:0] = 16'b0010011100010000; //1.0 (10000)
    S_QTZ = 1;

  // Scenario : > 0.88889
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b0001101101011000; //0.7 (7000)
    input_value[1][15:0] = 16'b0001101101011000; //0.7 (7000)
    input_value[2][15:0] = 16'b0001101101011000; //0.7 (7000)
    input_value[3][15:0] = 16'b0001101101011000; //0.7 (7000)
    
  // Scenario : 0.8889 > x > 0.66667
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b0001001110001000; //0.5 (5000)
    input_value[1][15:0] = 16'b0001001110001000; //0.5 (5000)
    input_value[2][15:0] = 16'b0001001110001000; //0.5 (5000)
    input_value[3][15:0] = 16'b0001001110001000; //0.5 (5000)

  // Scenario : 0.66667 > x > 0.44444
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b0000101110111000; //0.3 (3000)
    input_value[1][15:0] = 16'b0000101110111000; //0.3 (3000)
    input_value[2][15:0] = 16'b0000101110111000; //0.3 (3000)
    input_value[3][15:0] = 16'b0000101110111000; //0.3 (3000)

  // Scenario : 0.44444 > x > 0.22222
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b0000001111101000; //0.1 (1000)
    input_value[1][15:0] = 16'b0000001111101000; //0.1 (1000)
    input_value[2][15:0] = 16'b0000001111101000; //0.1 (1000)
    input_value[3][15:0] = 16'b0000001111101000; //0.1 (1000)

  // Scenario : 0.22222 > x > 0
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b1111110000011000; //-0.1
    input_value[1][15:0] = 16'b1111110000011000; //-0.1
    input_value[2][15:0] = 16'b1111110000011000; //-0.1
    input_value[3][15:0] = 16'b1111110000011000; //-0.1
    
  // Scenario : 0 > x > -0.22222
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b1111010001001000; //-0.3
    input_value[1][15:0] = 16'b1111010001001000; //-0.3
    input_value[2][15:0] = 16'b1111010001001000; //-0.3
    input_value[3][15:0] = 16'b1111010001001000; //-0.3

  // Scenario : -0.22222 > x > -0.44444
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b1110110001111000; //-0.5
    input_value[1][15:0] = 16'b1110110001111000; //-0.5
    input_value[2][15:0] = 16'b1110110001111000; //-0.5
    input_value[3][15:0] = 16'b1110110001111000; //-0.5

  // Scenario : -0.44444 > x > -0.66667
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b1110010010101000; //-0.7
    input_value[1][15:0] = 16'b1110010010101000; //-0.7
    input_value[2][15:0] = 16'b1110010010101000; //-0.7
    input_value[3][15:0] = 16'b1110010010101000; //-0.7

  // Scenario : -0.66667 > x > -0.88889
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b1101100011110000; //-1.0
    input_value[1][15:0] = 16'b1101100011110000; //-1.0
    input_value[2][15:0] = 16'b1101100011110000; //-1.0
    input_value[3][15:0] = 16'b1101100011110000; //-1.0

  // Scenario : x < -0.88889
    #1
    clk = 1;
    #1
    $display("CYCLE");
$display("%b", hv[0]);
$display("%b", hv[1]);
$display("%b", hv[2]);
$display("%b", hv[3]);
$display("%b", hv[4]);
$display("%b", hv[5]);
$display("%b", hv[6]);
$display("%b", hv[7]);
$display("%b", hv[8]);
$display("%b", hv[9]);
$display("%b", hv[10]);
$display("%b", hv[11]);
$display("%b", hv[12]);
$display("%b", hv[13]);
$display("%b", hv[14]);
$display("%b", hv[15]);
$display("%b", hv[16]);
$display("%b", hv[17]);
$display("%b", hv[18]);
$display("%b", hv[19]);
$display("%b", hv[20]);
$display("%b", hv[21]);
$display("%b", hv[22]);
$display("%b", hv[23]);
$display("%b", hv[24]);
$display("%b", hv[25]);
$display("%b", hv[26]);
$display("%b", hv[27]);
$display("%b", hv[28]);
$display("%b", hv[29]);
$display("%b", hv[30]);
$display("%b", hv[31]);
$display("%b", hv[32]);
$display("%b", hv[33]);
$display("%b", hv[34]);
$display("%b", hv[35]);
$display("%b", hv[36]);
$display("%b", hv[37]);
$display("%b", hv[38]);
$display("%b", hv[39]);

    clk = 0;
    input_value[0][15:0] = 16'b1110010010101000; //-0.7
    input_value[1][15:0] = 16'b1110010010101000; //-0.7
    input_value[2][15:0] = 16'b1110010010101000; //-0.7
    input_value[3][15:0] = 16'b1110010010101000; //-0.7
    
 // Buffer Scenario
    #1
    clk = 1;
    #1
    clk = 0;

  // // Scenario : nrst goes down
    #1
    nrst = 0;
    clk = 1;
    #1
    nrst = 1;
    clk = 0;
    input_value[0][15:0] = 16'b1101100011110000; //-1.0
    input_value[1][15:0] = 16'b1101100011110000; //-1.0
    input_value[2][15:0] = 16'b1101100011110000; //-1.0
    input_value[3][15:0] = 16'b1101100011110000; //-1.0

  // Scenario : enable is 0 when nrst is 1
    #1
    en = 0;
    clk = 1;
    #1
    clk = 0;
    #2
    
    $finish;
  end
endmodule
  
