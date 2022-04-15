module quantizer(
    input wire nrst,
    input wire en,   
    input wire [15:0] input_value, 
    output logic [3:0] quantized_value_level
    ); 
  
    always_comb begin
        if(!nrst) begin
            quantized_value_level = 0;
        end 
        else if (en) begin      
            if($signed(input_value) > 8889) begin
                quantized_value_level = 1;
            end          
            else if($signed(input_value) > 6667) begin
                quantized_value_level = 2;
            end 
            else if($signed(input_value) > 4444) begin
                quantized_value_level = 3;
            end
            else if($signed(input_value) > 2222) begin
                quantized_value_level = 4;
            end 
            else if($signed(input_value) > 0) begin
                quantized_value_level = 5;
            end 
            else if($signed(input_value) > -2222) begin
                quantized_value_level = 6;
            end
            else if($signed(input_value) > -4444) begin
                quantized_value_level = 7;
            end
            else if($signed(input_value) > -6667) begin
                quantized_value_level = 8;
            end
            else if($signed(input_value) > -8889) begin
                quantized_value_level = 9;
            end
            else begin
                quantized_value_level = 10;
            end
        end
        else begin
            quantized_value_level = quantized_value_level;
        end
    end
    
endmodule
