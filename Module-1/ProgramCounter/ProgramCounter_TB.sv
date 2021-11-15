module test();
  logic [31:0] Address = 4'b00000000000000000000000000000001;
  logic CLK;
  logic [31:0] out_Result;
  
  parameter T = 40;
  
  PROGRAM_COUNTER internPC(CLK,Address, out_Result);
  

   always begin
     CLK = 0;
     #(T/2);
     CLK = 1;
     #(T/2);
        
  end
  initial begin
      $dumpfile("outTB_PC.vcd");
      $dumpvars(1);
      
      #40 Address = 4'b00000000000000000000000000000101;
      
      #40 Address = 4'b00000000000000000000000000000111; 
      
      #40 Address = 4'b00000000000000000000000000000111; 
      
      
      #40 $finish;
      
    end
  
  
 
endmodule