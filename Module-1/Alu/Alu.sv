/*
  always @(todos) evalua cambios en los inputs
  el simbolo (*) realiza las operaiciones de forma asincrona
*/
  
  wire [31:0] signed_a;
  assign signed_a = A;
  
  wire [31:0] signed_b;
  assign signed_b = B;

  always@(*) begin
    case(ALU_Op)
      4'b0000: ALU_Result = A + B;
      4'b1000: ALU_Result = A - B;
      4'b0111: ALU_Result = A & B;
      4'b0110: ALU_Result = A | B;
      4'b0100: ALU_Result = A ^ B;
      4'b0001: ALU_Result = A << B;
      4'b0101: ALU_Result = A >> B;
      4'b1101: ALU_Result = signed_a >>> signed_a;
      4'b0010: ALU_Result = signed_a < signed_a;
      4'b0011: ALU_Result = signed_a <- signed_a;
    endcase
  end
endmodule