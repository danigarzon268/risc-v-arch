module test();
  logic [31:0] address;
  logic [31:0] instruction;
  
  InstMemory internIM(address,instruction);
  
  initial begin 
    $dumpfile("outIM.vcd");
    $dumpvars(1);
    
    address = 0;
    #20  address = 4;
    #20 address = 8;
    #20 address = 16;
  end 
 
endmodule