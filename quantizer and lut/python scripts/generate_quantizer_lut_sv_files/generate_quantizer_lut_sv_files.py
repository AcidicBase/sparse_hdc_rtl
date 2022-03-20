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

def generate_Encoder(hv_width, ds_input_width, parallel_count, filename):
  hv_max_index = hv_width - 1
  ds_input_max_index = ds_input_width - 1
  pl_max_index = parallel_count - 1

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
          10: begin
            S_ENC_START = 1;
            ctr = 0;
          end
          default: ctr = ctr + 1;
        endcase
      end
  end

  always@(negedge clk) begin
    S_ENC_START = 0;
  end
endmodule
  """.format(
    pl_max_index, ds_input_max_index,
    pl_max_index, hv_max_index,
    pl_max_index,
    pl_max_index, hv_max_index,
    hv_max_index,
    parallel_count,
    ds_input_max_index,
    parallel_count,
    hv_max_index,
    generate_sample_hv_assignment(hv_width)
  ))

def generate_verilog_files():
  hv_width = 64
  dataset_input_width = 16
  parallel_count = 4

  generate_IM_fetch(
    bit_width = hv_width,
    filename = "IM_Fetch.sv"
  )

  generate_Encoder(
    hv_width = hv_width,
    ds_input_width = dataset_input_width,
    parallel_count = parallel_count,
    filename = "Encoder.sv"
  )


generate_verilog_files()