module test(); 
  
  logic CLK,  
  logic [31:0] address,
  logic [31:0] dataWr,
  logic [31:0] dmWr,
  logic [2:0] dmCtrl,
  logic [31:0] dataRd;

  
  parameter T = 20; 
  
  DataMemory internDM(CLK,address,dataWr, dmWr,dmCtrl, dataRd);
  
  
  always begin
    CLK = 0;
    #(T/2);
    CLK = 1;
    #(T/2);
  end
  
  
  
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(1);

  end
  
  
endmodule
