module test();
  
  logic [6:0] funct7 = 7'b0110011;
  logic [2:0] funct3;
  logic [6:0] Op = 7'b0110011;
  logic [3:0] aluOp;
  logic RUWr;
  
  ControlUnit internCU(fuct7,fuct3, Op,aluOp, RUWr);
  
  initial begin 
    $dumpfile("outCU.vcd");
    $dumpvars(1);
    
    funct3 = 6;
    #20 funct3 = 3'b000;
    #20 funct3 = 3'b011;
    #20 $finish;
    
  end  
 
endmodule