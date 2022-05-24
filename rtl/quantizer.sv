module quantizer( 
    input wire [15:0] input_value, 
    output logic [3:0] quantized_value_level
    ); 
  
    always_comb begin
		if($signed(input_value) > 8888) begin
		    quantized_value_level = 4'd0;
		end          
		else if($signed(input_value) > 6666) begin
		    quantized_value_level = 4'd1;
		end 
		else if($signed(input_value) > 4444) begin
		    quantized_value_level = 4'd2;
		end
		else if($signed(input_value) > 2222) begin
		    quantized_value_level = 4'd3;
		end 
		else if($signed(input_value) > 0) begin
		    quantized_value_level = 4'd4;
		end 
		else if($signed(input_value) > -2223) begin
		    quantized_value_level = 4'd5;
		end
		else if($signed(input_value) > -4445) begin
		    quantized_value_level = 4'd6;
		end
		else if($signed(input_value) > -6667) begin
		    quantized_value_level = 4'd7;
		end
		else if($signed(input_value) > -8889) begin
		    quantized_value_level = 4'd8;
		end
		else begin
		    quantized_value_level = 4'd9;
		end
    end
    
endmodule
