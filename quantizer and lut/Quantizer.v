`include "FLOAT32_Comparator.v"

module Quantizer(input_value, quantized_value_level, en, nrst);
  input [31:0]input_value;
  input en, nrst;
  output reg [3:0]quantized_value_level;
  wire [19:0]result;
  
  reg [31:0]qlvl0 = 32'b00111111011000111000111011110011;
  reg [31:0]qlvl1 = 32'b00111111001010101010101011100011;
  reg [31:0]qlvl2 = 32'b00111110111000111000111001001100;
  reg [31:0]qlvl3 = 32'b00111110011000111000110110100100;
  reg [31:0]qlvl4 = 32'b00000000000000000000000000000000;
  reg [31:0]qlvl5 = 32'b10111110011000111000110110100100;
  reg [31:0]qlvl6 = 32'b10111110111000111000111001001100;
  reg [31:0]qlvl7 = 32'b10111111001010101010101011100011;
  reg [31:0]qlvl8 = 32'b10111111011000111000111011110011;
  
  
  FLOAT32_Comparator M0(
    .input_value(input_value),
    .compared_value(qlvl0), // 0.88889
    .result(result[1:0])
  );
  
  FLOAT32_Comparator M1(
    .input_value(input_value),
    .compared_value(qlvl1), //0.66667
    .result(result[3:2])
  );
  
  FLOAT32_Comparator M2(
    .input_value(input_value),
    .compared_value(qlvl2), //0.44444
    .result(result[5:4])
  );
  
  FLOAT32_Comparator M3(
    .input_value(input_value),
    .compared_value(qlvl3), //0.22222
    .result(result[7:6])
  );
  
  FLOAT32_Comparator M4(
    .input_value(input_value),
    .compared_value(qlvl4), //0
    .result(result[9:8])
  );
  
  FLOAT32_Comparator M5(
    .input_value(input_value),
    .compared_value(qlvl5), //-0.22222
    .result(result[11:10])
  );
  
  FLOAT32_Comparator M6(
    .input_value(input_value),
    .compared_value(qlvl6), //-0.44444
    .result(result[13:12])
  );
  
  FLOAT32_Comparator M7(
    .input_value(input_value),
    .compared_value(qlvl7), //-0.66667
    .result(result[15:14])
  );
  
  FLOAT32_Comparator M8(
    .input_value(input_value),
    .compared_value(qlvl8), //-0.88889
    .result(result[17:16])
  );

  always@(*) begin
    if(!nrst)
      quantized_value_level = 4'b0000;
    else begin
      if(en) begin
        if (result[1:0] == 2'b10)
          quantized_value_level = 4'b0000;
        else if (result[3:2] == 2'b10)
          quantized_value_level = 4'b0001;
        else if (result[5:4] == 2'b10)
          quantized_value_level = 4'b0010;
        else if (result[7:6] == 2'b10)
          quantized_value_level = 4'b0011;
        else if (result[9:8] == 2'b10)
          quantized_value_level = 4'b0100;
        else if (result[11:10] == 2'b10)
          quantized_value_level = 4'b0101;
        else if (result[13:12] == 2'b10)
          quantized_value_level = 4'b0110;
        else if (result[15:14] == 2'b10)
          quantized_value_level = 4'b0111;
        else if (result[17:16] == 2'b10)
          quantized_value_level = 4'b1000;
        else
          quantized_value_level = 4'b1001;
      end
    end

  end

endmodule

