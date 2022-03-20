module Quantizer(input_value, quantized_value_level, en, nrst);
  input [15:0] input_value;
  input en, nrst;
  output reg [3:0]quantized_value_level;
  
  always@(*) begin
    if(!nrst) begin
      quantized_value_level = 0;
    end else begin
      if( $signed(input_value[15:0]) > 8889)
        quantized_value_level = 1;
      else begin
        if ( $signed(input_value) > 6667)
          quantized_value_level = 2;
        else begin
          if ($signed(input_value) > 4444)
            quantized_value_level = 3;
          else begin
            if($signed(input_value) > 2222)
              quantized_value_level = 4;
            else begin
              if($signed(input_value) > 0)
                quantized_value_level = 5;
              else begin
                if($signed(input_value) > -2222)
                  quantized_value_level = 6;
                else begin
                  if($signed(input_value) > -4444)
                    quantized_value_level = 7;
                  else begin
                    if($signed(input_value) > -6667)
                      quantized_value_level = 8;
                    else begin
                      if($signed(input_value) > -8889)
                        quantized_value_level = 9;
                      else
                        quantized_value_level = 10;
                    end
                  end
                end
              end
            end  
          end
        end
      end
    end
  end
endmodule
