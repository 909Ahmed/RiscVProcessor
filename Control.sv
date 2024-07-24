module Control(
    input [6:0] instruction,
    output reg ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
    output reg[1:0] ALUOp
);
  
assign ALUsrc = (instruction == 7'b0110011) ? 1'b0 :
                (instruction == 7'b0000011) ? 1'b1 :
 			    (instruction == 7'b0100011) ? 1'b0 :
                (instruction == 7'b1100011) ? 1'b0 : 1'bx;

assign MemtoReg = (instruction == 7'b0110011) ? 1'b0 :
                  (instruction == 7'b0000011) ? 1'b1 :
                  (instruction == 7'b0100011) ? 1'b0 :
                  (instruction == 7'b1100011) ? 1'b0 : 1'bx;

assign RegWrite = (instruction == 7'b0110011) ? 1'b1 :
                  (instruction == 7'b0000011) ? 1'b1 :
                  (instruction == 7'b0100011) ? 1'b0 :
                  (instruction == 7'b1100011) ? 1'b0 : 1'bx;

assign MemRead = (instruction == 7'b0110011) ? 1'b0 :
    			 (instruction == 7'b0000011) ? 1'b1 :
                 (instruction == 7'b0100011) ? 1'b0 :
                 (instruction == 7'b1100011) ? 1'b0 : 1'bx;

assign MemWrite = (instruction == 7'b0110011) ? 1'b0 :
  				  (instruction == 7'b0000011) ? 1'b0 :
    			  (instruction == 7'b0100011) ? 1'b1 :
                  (instruction == 7'b1100011) ? 1'b0 : 1'bx;

assign Branch =   (instruction == 7'b0110011) ? 1'b0 :
  				  (instruction == 7'b0000011) ? 1'b0 :
                  (instruction == 7'b0100011) ? 1'b0 :
			      (instruction == 7'b1100011) ? 1'b1 : 1'bx;
  
assign ALUOp = (instruction == 7'b0110011) ? 2'b10 :
               (instruction == 7'b0000011) ? 2'b00 :
               (instruction == 7'b0100011) ? 2'b00 :
               (instruction == 7'b1100011) ? 2'b01 : 2'bxx;


  
endmodule
