module test();
  logic [31:0] A = 0;
  logic [31:0] B = 0;
  logic Operator = 0;
  logic [31:0] MUX_Alu_B_Result;
  
  
  MUX_Alu_B internMUX_Alu_B(A, B, Operator, MUX_Alu_B_Result);
  

  initial
    begin
      $dumpfile("outTB_MUX_Alu_B.vcd");
      $dumpvars(1);
      
      #50 A = 4'b00000000000000000000000000000001; 
      B = 4'b00000000000000000000000000000000;
      Operator = 1;
      
      #50 A = 4'b00000000000000000000000000000001; 
      B = 4'b00000000000000000000000000000000;
      Operator = 0;
      
      #50 A = 4'b00000000000000000000000000000000; 
      B = 4'b00000000000000000000000000000001;
      Operator = 0;
      
      #50 A = 4'b00000000000000000000000000000000; 
      B = 4'b00000000000000000000000000000001;
      Operator = 5;
      
      
      #50 $finish;
      
    end
  
  
endmodule