module tb_IM_Fetch();
  reg [3:0]qlevel;
  reg en, nrst;
  wire [9:0]level_hv;
  
  IM_Fetch UUT(
    .qlevel(qlevel),
    .en(en),
    .nrst(nrst),
    .level_hv(level_hv)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    en = 1;
    nrst = 0;
    #5
    
    // Scenario : When qlevel is in range
    nrst = 1;
    qlevel = 4'b0100;
    #5
    
    // Scenario : When qlevel is out of range
    $finish;
  end
endmodule
  
  