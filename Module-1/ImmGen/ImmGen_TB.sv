module test();
  logic [31:0] Inst;
  logic [2:0] ImmSrc;
  logic [31:0] ImmExt;
  
  ImmGen internIG(Inst,ImmSrc, ImmExt);
  
  initial begin 
    $dumpfile("outIG.vcd");
    $dumpvars(1);
    
    //Prueba intruccion tipo I
    Inst = 32'b00000000000000110000001010010011;
    ImmSrc = 3'b000;
   	#20  Inst = 32'b00000000000100110000001010010011;
    #20  Inst = 32'b00000000001000110000001010010011;
    
    //Prueba intruccion tipo S
    #20 Inst = 32'b00000000000000110000000000010011;
    #20 ImmSrc = 3'b001;
   	#20  Inst = 32'b00000000000100110000000010010011;
    #20  Inst = 32'b00000000001100110000000110010011;
    #20 $finish;
  end 
  
endmodule