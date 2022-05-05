module am_accuracy_tally( 
    input wire clk,
    input wire nrst,
    input wire tallying_accuracy,
    input wire [4:0] correct_class,
    input wire [4:0] class_inference,
    output logic [10:0] number_of_correct_inferences   
    );

	wire correct_inference;

	assign correct_inference = (class_inference == correct_class) ? 1'b1 : 1'b0;
    
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            number_of_correct_inferences = 0;
        end
        else if(tallying_accuracy) begin
            number_of_correct_inferences = number_of_correct_inferences + correct_inference;
        end
        else begin
            number_of_correct_inferences = number_of_correct_inferences;
        end
    end

endmodule
