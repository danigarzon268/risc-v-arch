module ControlUnit(

    // Entradas
    input [6:0] funct7,
    input [2:0] funct3,
  	input [6:0] Op,
    // Salidas
  	output logic [3:0] ALUOp,
    output logic RUWr,
  	output logic [4:0] BrOp,
  	output logic [3:0] ALUASrc,
    output logic ALUBSrc,
    output logic [2:0] ImmSrc,
    output logic DMWr,
    output logic [2:0] DMCtrl,
    output logic [1:0] RUDataWrSrc


);
  always @(funct3 or funct7 or Op)
    begin
      if (Op == 7'b0110011) begin 

            RUWr = 1;

            case (funct3)
                0: begin
                    if(funct7 == 0)
                    aluOp = 4'b0010; 
                    else if(funct7 == 32)
                    aluOp = 4'b0100;
                end
                6: aluOp = 4'b0001; 
                7: aluOp = 4'b0000; 
                1: aluOp = 4'b0011; 
                5: aluOp = 4'b0101; 
				2: aluOp = 4'b0110; 
				4: aluOp = 4'b0111; 
            endcase

      end

    end

endmodule