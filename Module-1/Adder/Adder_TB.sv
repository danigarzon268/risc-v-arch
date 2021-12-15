module test();
  logic [31:0] PC = 4'b00000000000000000000000000000001;
  
  logic [31:0] Adder_Result;
  
  
  ADDER internADDER(PC, Adder_Result);
  
  

  initial
    begin
      $dumpfile("outTB_ADDER.vcd");
      $dumpvars(1);
      
      #50 PC = 4'b00000000000000000000000000000001;
      #50 PC = 4'b00000000000000000000000000000010;
      #50 PC = 4'b00000000000000000000000000000011;
      #50 PC = 4'b00000000000000000000000000000100;
      #50 PC = 4'b00000000000000000000000000000101;
      #50 PC = 4'b00000000000000000000000000000111;
      
      
      #50 $finish;
      
    end
  
  
endmodule