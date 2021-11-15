module MUX_Alu_A(
  input logic [31:0] A,
  input logic [31:0] B,
  input logic Operator,
  output logic [31:0] MUX_Alu_A_Result
);
  
  always@(*) begin
    if(Operator == 1)
      MUX_Alu_A_Result = A;
    else 
      MUX_Alu_A_Result = B;
  end
  
endmodule