module ALUControl(
  
  input [31:0] instruction,
  input [1:0] ALUOp,
  output reg [3:0] ALUIn
  
);

  assign ALUIn = (ALUOp == 2'b00) ?  4'b0010 : (ALUOp == 2'b01) ?  4'b0110 : (instruction[14:12] == 3'b000) ? (instruction[31:25] == 7'b0000000) ? 4'b0010 : 4'b0110 : (instruction[14:12] == 3'b111) ? 4'b0000 : 4'b0001;
    
endmodule
