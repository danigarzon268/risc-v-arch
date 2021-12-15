`include "Adder.sv"
`include "Alu.sv"
`include "BranchUnit.sv"
`include "ControlUnit.sv"
`include "DataMemory.sv"
`include "ImmGen.sv"
`include "InstructionMemory.sv"
`include "Mux_Alu_A.sv"
`include "Mux_Alu_B.sv"
`include "Mux_DM.sv"
`include "Mux_PC.sv"
`include "ProgramCounter.sv"
`include "RegUnit.sv"

module Proces(
  input logic CLK
);
  logic [31:0] PC;
  logic [31:0] PCAddress;
  logic [31:0] ALUA;
  logic [31:0] ALUB;
  logic [3:0] ALUOp;
  logic [31:0] ALURes;
  logic [31:0] rs1;
  logic [31:0] rs2;
  logic [4:0] BrOp;
  logic NextPCSrc;
  logic [2:0] funct3;
  logic [6:0] funct7;
  logic [6:0] OP;
  logic RUWr;
  logic ALUASrc;
  logic ALUBSrc;
  logic DMWr;
  logic [2:0] DMCtrl;
  logic [1:0] RUDataWrSrc;
  logic [31:0] DataRd;
  logic [31:0] Inst;
  logic [31:0] ImmExt;
  logic [2:0] ImmSrc;
  logic [31:0] NextPC;  
  logic [31:0] DataWr;
  logic [4:0] AddressRs1;
  logic [4:0] AddressRs2;
  logic [4:0] rd;

  //assign Op = Inst[6:0];
  assign funct3 = Inst[14:12];
  assign funct7 = Inst[31:25];
  
  assign AddressRs1 = Inst[19:15];
  assign AddressRs2 = Inst[24:20];
  assign rd = Inst[11:7];


  add Adder(
    PC,
    PCAddress
  );

   alu ALU(
    ALUA,
    ALUB,
    ALUOp,
    ALURes
  );

  br BranchUnit(
    rs1,
    rs2,
    BrOp,
    NextPCSrc
  );

 
  cu ControlUnit(
    funct7,
    funct3,
    Op,
    ALUOp,
    RUWr,
  	BrOp,
  	ALUASrc,
    ALUBSrc,
    ImmSrc,
    DMWr,
    DMCtrl,
    RUDataWrSrc
  );

  dm DataMemory(
    ALURes,
    DMWr,
    DMCtrl,
    rs2,
    DataRd
  );

  ig ImmGen(
    Inst,
    ImmSrc,
    ImmExt
  );

  im InstructionMemory(
    PCAddress,
    Inst
  );

  ma_A Mux_Alu_A(
    ALUASrc,
    rs1,
    PCAddress,
    ALUA
  );

  ma_B Mux_Alu_B(
    ALUBSrc,
    rs2,
    PCAddress,
    ALUB
  );

  m_Dm Mux_DataMemory(
    RUDataWrSrc,
    PC,
    DataRd,
    ALURes,
    DataWr
  );
  m_Pc Mux_ProgramCounter(
    NextPCSrc,
    PC,
    ALURes,
    NextPC
  );

   pc ProgramCounter(
    CLK,
    NextPC,
    PCAddress
  );

  ru RegisterUnit(
    CLK,
    rs1,
    rs2,
    rd,
    DataWr,
    RUWr,
    AddressRs1, 
    AddressRs2, 
  );
  


endmodule