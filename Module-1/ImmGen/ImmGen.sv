module ImmGen (
  /*Entradas*/
  input logic signed [31:0] Inst,
  input logic signed [2:0] ImmSrc,
  /*Salidas*/
  output logic  [31:0] ImmExt
);

   always@(*) begin 
     
    case(ImmSrc)
      
      3'b000: ImmExt = {{20 {Inst[31]}},Inst[31:20]}; //Tipo I 
      
      3'b001: ImmExt = {{7 {Inst[11]}}, Inst[11:7], {13 {Inst [31]}}, Inst[31:25]};
      //Tipo S 
      
      3'b010: ImmExt = {{20 {Inst[31]}},Inst[7],Inst[31:25], Inst[11: 8], 1'b0};//Tipo B 
      
      3'b011: ImmExt = {{12 {Inst[31]}},Inst[31:20],Inst[19:12], 12'b0} ; //Tipo U 
      
      3'b000: ImmExt = {{12 {Inst[31]}},Inst[19:12],Inst[20],Inst[30:25], Inst[24:21], 1'b0}; //Tipo J
      
    endcase
  end
    
endmodule