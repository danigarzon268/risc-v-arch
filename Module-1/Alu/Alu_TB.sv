module test();
  logic [31:0] A = 4'b00000000000000000000000000000011;
  logic [31:0] B = 4'b00000000000000000000000000000010;
  logic [3:0] ALU_Op = 4'b0000;
  logic [31:0] ALU_Result;
  
  
  ALU internAlu(A, B, ALU_Op, ALU_Result);
  
  
/*
  El dumpfile define en donde se van a registrar las salidas del
  testbench
  
  el dumpvars define el scoope de donde se esta realizando la
  instancia del test. 1, significa scoope actual, y 2 el scoope
  del modulo interno.
*/
  initial
    begin
      $dumpfile("outTB_ALU.vcd");
      $dumpvars(1);
      
      /*
      	definimos los valores a probar
      */
      
      
      #50 ALU_Op = 4'b1000;
      #50 ALU_Op = 4'b0111;
      #50 ALU_Op = 4'b0110;
      #50 ALU_Op = 4'b0100;
      #50 ALU_Op = 4'b0001;
      #50 ALU_Op = 4'b0101;
      #50 ALU_Op = 4'b1101;
      #50 ALU_Op = 4'b0010;
      #50 ALU_Op = 4'b0011;
      
      #50 $finish;
      
    end
  
  
endmodule