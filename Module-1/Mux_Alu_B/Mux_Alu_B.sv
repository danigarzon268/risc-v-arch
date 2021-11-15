module MUX_Alu_B(
  input logic [31:0] A,
  input logic [31:0] B,
  input logic Operator,
  output logic [31:0] MUX_Alu_B_Result
);
  
  always@(*) begin
    if(Operator == 0)
      MUX_Alu_B_Result = A;
    else 
      MUX_Alu_B_Result = B;
  end
  
endmodule