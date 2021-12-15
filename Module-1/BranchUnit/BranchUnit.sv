module BranchUnit(
  input logic signed [31:0] RFrs1,
  input logic signed [31:0] RFrs2,
  input logic [4:0] BrOp,
  output logic NextPCSrc
);
  always@(*) begin
    if (BrOp[4])
      NextPCSrc = 1;
    else begin
      if (BrOp[3])begin
        case(BrOp[2:0])
          3'b000: NextPCSrc = (RFrs1 == RFrs2);
          3'b100: NextPCSrc = (RFrs1 < RFrs2);
          3'b101: NextPCSrc = (RFrs1 >= RFrs2)
          3'b001: NextPCSrc = (RFrs1 != RFrs2);
          3'b110: NextPCSrc = ($unsigned(RFrs1) < $unsigned(RFrs2));
          3'b111: NextPCSrc = ($unsigned(RFrs1) >= $unsigned(RFrs2));
          default: NextPCSrc = 0;
        endcase
      end
      else
        NextPCSrc = 0;
    end
  end
endmodule