`timescale 1ns / 1ps
//THIS IS THE FULL-WIDTH ACC
module assoc_accumulator(clk, nrst, acc_en,state,sum_input, stored_score);
    input clk, nrst, acc_en;
    input [9:0] sum_input;
    input [3:0] state;
    output reg [12:0] stored_score;

    always @ (posedge clk or negedge nrst) begin
        if(!nrst) begin
            stored_score <= 13'd0;
        end
        else begin
            if(state == 4'd0) begin
                if (acc_en) begin
                    stored_score <= 13'd0 + {3'b000,sum_input};
                end
                else begin end
            end
            else begin 
                if (acc_en) begin
                    stored_score <= stored_score + {3'b000,sum_input};
                end
                else begin end
            end
            
        end
    end
endmodule
