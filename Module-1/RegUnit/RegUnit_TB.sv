module test(); 
  
  logic CLK;
  logic [4:0] rs1;
  logic [4:0] rs2;
  logic [4:0] rd;
  
  logic [31:0] DataWr;
  logic RFWr;

  
  logic [31:0] RFrs1;
  logic [31:0] RFrs2;
  
  parameter T = 20; 
  
  RegUnit internRU(CLK,rs1,rs2, rd,DataWr, RFWr,RFrs1,RFrs2);
  
  
  always begin
    CLK = 0;
    #(T/2);
    CLK = 1;
    #(T/2);
  end
  
  
  
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(1);
  
	rs1 = 0; rs2 = 0; rd = 0; DataWr = 35; RFWr = 1;
  
  	#20 rs1 = 0; rs2 = 0; rd = 1; DataWr = 68; RFWr = 1;
  	#20 rs1 = 0; rs2 = 0; rd = 2; DataWr = 29; RFWr = 1;
  	#20 rs1 = 0; rs2 = 0; rd = 3; DataWr = 7; RFWr = 1;
  	#20 rs1 = 0; rs2 = 0; rd = 4; DataWr = 88; RFWr = 1;
  	#20 rs1 = 0; rs2 = 0; rd = 5; DataWr = 55; RFWr = 1;
  
  	#20 rs1 = 0; rs2 = 1; rd = 0; DataWr = 0; RFWr = 0;
  	#20 rs1 = 2; rs2 = 3; rd = 0; DataWr = 0; RFWr = 0;
  	#20 rs1 = 4; rs2 = 5; rd = 0; DataWr = 0; RFWr = 0;
  	#20 $finish;
  end
  
  
endmodule