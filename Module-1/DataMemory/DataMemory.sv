module DataMemory (

  input logic CLK,  
  input logic [31:0] address,
  input logic [31:0] dataWr,
  input logic [31:0] dmWr,
  input logic [2:0] dmCtrl,
  output logic [31:0] dataRd
);
  
  logic [31:0]DM[255:0];
  
  always @(posedge CLK) begin
    
    
    if(dataWr) begin
      DM[address] = dmWr;  	
  	else if (dataRd)
        dataWr = DM[address] = dmWr; 
  	end
   
  end
endmodule