module test();
  logic [31:0] A = 1;
  logic [31:0] B = 0;
  logic [31:0] C = 0;
  logic [1:0] Operator = 4'b10;
  logic [31:0] MUX_Result;
  
  
  MUX_DM internMUX_DM(A, B, C, Operator, MUX_Result);
  

  initial
    begin
      $dumpfile("outTB_MUX_DM.vcd");
      $dumpvars(1);
      
      // should return A
      A = 4'b00000000000000000000000000000010; 
      B = 4'b00000000000000000000000000000000;
      C = 4'b00000000000000000000000000000000;
      #20 Operator = 4'b10;
      
      // should return B
      A = 4'b00000000000000000000000000000001; 
      B = 4'b00000000000000000000000000000010;
      C = 4'b00000000000000000000000000000000;
      #20 Operator = 4'b01;
      
      // should return c
      A = 4'b00000000000000000000000000000001; 
      B = 4'b00000000000000000000000000000010;
      C = 4'b00000000000000000000000000000011;
      #20 Operator = 4'b00;
      
       // should return 0
      A = 4'b00000000000000000000000000000011; 
      B = 4'b00000000000000000000000000000011;
      C = 4'b00000000000000000000000000000011;
      #20 Operator = 4'b11;
      
      
      #20 $finish;
      
    end
  
  
endmodule