module tb_sample();
  reg clk;
  
  sample UUT(
    .clk(clk)
  );
  
  initial begin
    clk = 0;
    #10
    $finish;
  end
endmodule
  