module PROGRAM_COUNTER(
  input logic CLK,
  input logic [31:0] Address,
  output logic [31:0] out_Result
);

  
  always @(posedge CLK) begin
    out_Result <= Address;
  end
  
endmodule