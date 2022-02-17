module FLOAT32_Comparator(
  input_value,
  compared_value,
  result
);

  input [31:0]input_value;
  input [31:0]compared_value;
  output reg [1:0]result;
  
  // Result
  // 1 if input < compared
  // 2 if input > compared
  // 0 if equal
  
  always@(*) begin
    // Check Sign
    if (input_value[31] > compared_value[31])
      result = 2'b01;
    else if (input_value[31] < compared_value[31])
      result = 2'b10;
    else begin
      // Equal Sign
      
      // Check Exponent
      if ( input_value[30:23] > compared_value[30:23] ) begin
        if ( input_value[31] == 1 )
          result = 2'b01;
        else
          result = 2'b10;
      end else if ( input_value[30:23] < compared_value[30:23] ) begin
        if ( input_value[31] == 1 )
          result = 2'b10;
        else
          result = 2'b01;
      end else begin
        // Equal Exponent
        
        // Check Mantissa
        if ( input_value[22:0] > compared_value[22:0] ) begin
          if ( input_value[31] == 1 )
            result = 2'b01;
          else
            result = 2'b10;
        end else if (input_value[22:0] < compared_value[22:0]) begin
          if ( input_value[31] == 1 )
            result = 2'b10;
          else
            result = 2'b01;
        end else
          // Equal Mantissa (Identical)
          result = 2'b00;
      end
    end
  end
 
 
endmodule
