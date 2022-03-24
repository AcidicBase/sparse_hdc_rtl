def wline(file, string):
  file.write(string + "\n")

def wlines(file, string):
  for line in string.split("\n"):
    file.write(line + "\n")

def generate_sample_hv_assignment(bit_width):
  output = ""

  for i in range(0, 10):
    if i>0:
      output += "\t\t\t"
    output += "im_hvs[{}] = ".format(i)
    output += format(i, "#0{}b".format(bit_width)).replace("0b", "{}'b".format(bit_width))
    output += ";"
    if i!=9:
      output += "\n"

  return output

def generate_hv_assignment():
  o = ""

  for i in range(0, 10):
    f = open("../generate_hv_assignment/item_memory/im_hv{}.txt".format(i), "r")
    o += "im_hvs[{}] = 5000'b{}".format(i, f.readline())
    o += ";\n"

  f.close()
  return o

def generate_IM_fetch(bit_width, filename):
  max_index = bit_width - 1
  o = open(filename, "w+")
  wlines(o, """module IM_Fetch(
  im1, im2, im3, im4, im5, im6, im7, im8, im9, im10,
  qlevel, level_hv, en, nrst);

  input [{}:0] im1, im2, im3, im4, im5, im6, im7, im8, im9, im10;
  input [3:0]qlevel;
  input en, nrst;
  output reg [{}:0] level_hv;
  
  always@(*) begin
    if (!nrst)
      level_hv = 0;
    else begin
      if(en) begin
        case(qlevel)
          1 : level_hv = im1;
          2 : level_hv = im2;
          3 : level_hv = im3;
          4 : level_hv = im4;
          5 : level_hv = im5;
          6 : level_hv = im6;
          7 : level_hv = im7;
          8 : level_hv = im8;
          9 : level_hv = im9;
          10 : level_hv = im10;
          default : level_hv = 0;
        endcase
      end
    end
  end
  endmodule""".format(
    max_index,
    max_index
  ))

  o.close()

def generate_output_assignment_cases(parallel_count, sample_period): #Sample period is in clock cycles
  output = ""
  for case_no in range(0, sample_period+1):
    if case_no!=0:
      output += "\t\t\t\t\t"

    output += "{}: begin\n".format(case_no)

    if case_no!=sample_period:
      for fetch_index in range(0, parallel_count):
        hv_output_index = case_no*parallel_count + fetch_index
        output += "\t\t\t\t\t\thv[{}] = im_fetch_output[{}];\n".format(hv_output_index, fetch_index)
      output += "\t\t\t\t\t\tctr = ctr + 1;\n"
    else:
      output += "\t\t\t\t\t\tS_ENC_START = 1;\n"
      output += "\t\t\t\t\t\tctr = 0;\n"
    
    output += "\t\t\t\t\tend\n"

  return output

def generate_Encoder(hv_width, ds_input_width, parallel_count, filename, sample_period):
  hv_max_index = hv_width - 1
  ds_input_max_index = ds_input_width - 1
  pl_max_index = parallel_count - 1
  sample_period_max_index = sample_period - 1

  o = open(filename, "w+")
  wlines(o, """`include "Quantizer.sv"
`include "IM_Fetch.sv"

module Encoder(input_value, hv, clk, en, nrst, S_ENC_START, S_QTZ);
  input [{}:0][{}:0]input_value;
  input clk, en, nrst;
  input S_QTZ;
  output reg [{}:0][{}:0]hv;
  output reg S_ENC_START;
  wire [{}:0][3:0]quantized_value_level;
  wire [{}:0][{}:0]im_fetch_output;

  // Declare and initialize Item Memory
  reg [{}:0] im_hvs [9:0];    

  generate
    genvar i;
    for (i=0; i<{}; i=i+1) begin : qtzs
      Quantizer qtz(
        .input_value(input_value[i][{}:0]),
        .nrst(nrst),
        .en(en),
        .quantized_value_level(quantized_value_level[i][3:0])
      );
    end
  endgenerate

  generate
    genvar j;
    for (j=0; j<{}; j=j+1) begin : ims
      IM_Fetch im(
        .im1(im_hvs[0]),
        .im2(im_hvs[1]),
        .im3(im_hvs[2]),
        .im4(im_hvs[3]),
        .im5(im_hvs[4]),
        .im6(im_hvs[5]),
        .im7(im_hvs[6]),
        .im8(im_hvs[7]),
        .im9(im_hvs[8]),
        .im10(im_hvs[9]),
        .qlevel(quantized_value_level[j][3:0]),
        .en(en),
        .nrst(nrst),
        .level_hv(im_fetch_output[j][{}:0])
      );
    end
  endgenerate

  initial begin
    {}
  end

  integer ctr = 0;
  always@(posedge clk) begin
    if(!nrst) begin
      hv = 0;
      S_ENC_START = 0;
    end else
      if(en && S_QTZ) begin
        hv = im_fetch_output;

        case(ctr)
          {}
        endcase
      end
  end

  always@(negedge clk) begin
    S_ENC_START = 0;
  end
endmodule
  """.format(
    pl_max_index, ds_input_max_index,
    sample_period_max_index, hv_max_index,
    pl_max_index,
    pl_max_index, hv_max_index,
    hv_max_index,
    parallel_count,
    ds_input_max_index,
    parallel_count,
    hv_max_index,
    generate_sample_hv_assignment(hv_width),
    generate_output_assignment_cases(parallel_count, sample_period)
  ))

def generate_encoder_testbench_display(sample_period, parallel_count):
  output = "$display(\"CYCLE\");\n"

  for i in range(0, sample_period*parallel_count):
    output += "$display(\"%b\", hv[{}]);\n".format(i)

  
  return output
    
  
def generate_encoder_testbench(parallel_count, sample_period):
  pl_max_index = parallel_count - 1
  sample_period_max_index = sample_period - 1

  display_code = generate_encoder_testbench_display(
    parallel_count = parallel_count,
    sample_period = sample_period
  )

  o = open("TB_Encoder.sv", "w+")

  wlines(o, """
  module tb_encoder();
  reg [{}:0][15:0]input_value;
  reg clk, en, nrst;
  reg S_QTZ;
  wire [{}:0][63:0]hv;
  
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
    {}
    clk = 0;
    input_value[0][15:0] = 16'b0001101101011000; //0.7 (7000)
    input_value[1][15:0] = 16'b0001101101011000; //0.7 (7000)
    input_value[2][15:0] = 16'b0001101101011000; //0.7 (7000)
    input_value[3][15:0] = 16'b0001101101011000; //0.7 (7000)
    
  // Scenario : 0.8889 > x > 0.66667
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b0001001110001000; //0.5 (5000)
    input_value[1][15:0] = 16'b0001001110001000; //0.5 (5000)
    input_value[2][15:0] = 16'b0001001110001000; //0.5 (5000)
    input_value[3][15:0] = 16'b0001001110001000; //0.5 (5000)

  // Scenario : 0.66667 > x > 0.44444
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b0000101110111000; //0.3 (3000)
    input_value[1][15:0] = 16'b0000101110111000; //0.3 (3000)
    input_value[2][15:0] = 16'b0000101110111000; //0.3 (3000)
    input_value[3][15:0] = 16'b0000101110111000; //0.3 (3000)

  // Scenario : 0.44444 > x > 0.22222
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b0000001111101000; //0.1 (1000)
    input_value[1][15:0] = 16'b0000001111101000; //0.1 (1000)
    input_value[2][15:0] = 16'b0000001111101000; //0.1 (1000)
    input_value[3][15:0] = 16'b0000001111101000; //0.1 (1000)

  // Scenario : 0.22222 > x > 0
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b1111110000011000; //-0.1
    input_value[1][15:0] = 16'b1111110000011000; //-0.1
    input_value[2][15:0] = 16'b1111110000011000; //-0.1
    input_value[3][15:0] = 16'b1111110000011000; //-0.1
    
  // Scenario : 0 > x > -0.22222
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b1111010001001000; //-0.3
    input_value[1][15:0] = 16'b1111010001001000; //-0.3
    input_value[2][15:0] = 16'b1111010001001000; //-0.3
    input_value[3][15:0] = 16'b1111010001001000; //-0.3

  // Scenario : -0.22222 > x > -0.44444
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b1110110001111000; //-0.5
    input_value[1][15:0] = 16'b1110110001111000; //-0.5
    input_value[2][15:0] = 16'b1110110001111000; //-0.5
    input_value[3][15:0] = 16'b1110110001111000; //-0.5

  // Scenario : -0.44444 > x > -0.66667
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b1110010010101000; //-0.7
    input_value[1][15:0] = 16'b1110010010101000; //-0.7
    input_value[2][15:0] = 16'b1110010010101000; //-0.7
    input_value[3][15:0] = 16'b1110010010101000; //-0.7

  // Scenario : -0.66667 > x > -0.88889
    #1
    clk = 1;
    #1
    {}
    clk = 0;
    input_value[0][15:0] = 16'b1101100011110000; //-1.0
    input_value[1][15:0] = 16'b1101100011110000; //-1.0
    input_value[2][15:0] = 16'b1101100011110000; //-1.0
    input_value[3][15:0] = 16'b1101100011110000; //-1.0

  // Scenario : x < -0.88889
    #1
    clk = 1;
    #1
    {}
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
  """.format(
    pl_max_index,
    sample_period*parallel_count - 1,
    display_code,
    display_code,
    display_code,
    display_code,
    display_code,
    display_code,
    display_code,
    display_code,
    display_code,
    display_code
  ))

def generate_verilog_files():
  hv_width = 64
  dataset_input_width = 16
  parallel_count = 4
  sample_period = 10 #Clock cycles

  generate_IM_fetch(
    bit_width = hv_width,
    filename = "IM_Fetch.sv"
  )

  generate_Encoder(
    hv_width = hv_width,
    ds_input_width = dataset_input_width,
    parallel_count = parallel_count,
    filename = "Encoder.sv",
    sample_period = sample_period
  )

  generate_encoder_testbench(
    sample_period = sample_period,
    parallel_count = parallel_count
  )


generate_verilog_files()