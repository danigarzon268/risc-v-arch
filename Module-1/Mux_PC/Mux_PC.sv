module MUX_PC(
  input logic [31:0] A,
  input logic [31:0] B,
  input logic Operator,
  output logic [31:0] MUX_PC_Result
);
  
  always@(*) begin
    if(Operator == 0)
      MUX_PC_Result = A;
    else 
      MUX_PC_Result = B;
  end
  
endmodule