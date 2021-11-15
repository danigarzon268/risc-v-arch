module RegUnit (

  input logic CLK,
  
  /*Inputs asíncronos*/
  
  input logic [4:0] rs1,
  input logic [4:0] rs2,
  
  
  /*Inputs síncronos*/
  
  input logic [4:0] rd,
  input logic [31:0] DataWr,
  input logic RFWr,
  
  
  /*Salidas*/

  output logic [31:0] RFrs1,
  output logic [31:0] RFrs2
);
  

  logic [31:0] RF [31:0];
   
  /*Llenar el RF*/
  
  initial begin 
    $readmemb("Registros.txt", RF);
  end
  
  /* Implementación parte asíncrona*/
  
  assign RFrs1 = RF[rs1]; 
  assign RFrs2 = RF[rs2]; 
  
  /* Implementación parte síncrona*/
  
  always @(posedge CLK) begin
    
    /*Validamos El RFWr*/
    
    if(RFWr == 1)
      RF[rd] = DataWr;
   
  end
  
endmodule