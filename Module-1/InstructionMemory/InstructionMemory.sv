module InstMemory (
  
  /*Entradas*/
  input logic [31:0] address,
 
  /*Salidas*/

  output logic [31:0] instruction
);
  

  logic [7:0]IM[(2**8): 0];
   
  
  initial begin 
    $readmemb("Intructions.txt", IM);
  end
  assign instruction = {IM[address], IM[address+1], IM[address+2], IM[address+3]};
                 
 
endmodule