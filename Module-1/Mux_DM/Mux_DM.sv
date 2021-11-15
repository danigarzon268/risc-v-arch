module MUX_DM(
  input logic [31:0] A,
  input logic [31:0] B,
  input logic [31:0] C,
  input logic [1:0] Operator,
  output logic [31:0] MUX_Result
);
  
  always@(*) begin
    case(Operator)
      4'b10: MUX_Result = A;
      4'b01: MUX_Result = B;
      4'b00: MUX_Result = C;
      default MUX_Result = 4'b00000000000000000000000000000000;
    endcase
       
  end
  
endmodule