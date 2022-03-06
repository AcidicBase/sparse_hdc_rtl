module FSM_encoding(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_encoding,              // change at negedge of the clk for 1 period
    output logic start_shifting,
    output logic start_acc_thr
    );
       
    typedef enum logic [1:0] {S_IDLE, S_SHIFT, S_ACC_THR} STATE;
    STATE state;   
        
    // state transition
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            state <= S_IDLE;
        end
        else begin
            case(state) 
                S_IDLE:
                    if(start_encoding && en) begin
                        state <= S_SHIFT;
                    end
                    else begin
                        state <= S_IDLE;
                    end
                S_SHIFT: state <= S_ACC_THR;
                default: state <= S_IDLE; 
            endcase
        end 
     end 
     
     // output control signals (fully comb.)
     always @(*) begin
        case(state)
            S_IDLE:  {start_shifting, start_acc_thr} = {1'b0, 1'b0};          
            S_SHIFT: {start_shifting, start_acc_thr} = {1'b1, 1'b0};
            default: {start_shifting, start_acc_thr} = {1'b0, 1'b1};     
        endcase
     end

endmodule
