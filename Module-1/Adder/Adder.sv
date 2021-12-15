module ADDER(
  input logic [31:0] PC,
  output logic [31:0] Adder_Result
);
  
  always@(*) begin
  	Adder_Result = 4 + PC;
  end
  
endmodule