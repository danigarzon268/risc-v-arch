module ADDER(
  input logic [31:0] A,
  input logic [31:0] B,
  output logic [31:0] Adder_Result
);
  
  always@(*) begin
  	Adder_Result = A + B;
  end
  
endmodule