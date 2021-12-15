module ALU(
  input logic  [31:0] A,
  input logic  [31:0] B,
  input logic  [3:0] ALU_Op,
  output logic  [31:0] ALU_Result
);

  always@(*) begin
    case(ALU_Op)
      4'b0000: ALU_Result = A + B;
      4'b1000: ALU_Result = A - B;
      4'b0111: ALU_Result = A & B;
      4'b0110: ALU_Result = A | B;
      4'b0100: ALU_Result = A ^ B;
      4'b0001: ALU_Result = A << B;
      4'b0101: ALU_Result = A >> B;
      4'b1101: ALU_Result = A >>> A;
      4'b0010: ALU_Result = A < A;
      4'b0011: ALU_Result = A <- A;
    endcase
  end
endmodule