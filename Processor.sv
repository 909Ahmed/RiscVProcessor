`include "ALU.sv"
`include "ALUControl.sv"
`include "Control.sv"
`include "InstMem.sv"
`include "Memory.sv"
`include "RegFile.sv"
`include "PC.sv"
`include "ImmGen.sv"


module Processor();


    reg [63:0] pc_in, pc_out;
    reg ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    reg [63:0] Readdata1, Readdata2, WriteData;
    reg [1:0] ALUOp;
    reg [63:0] imm_out;
    reg [31:0] instruction;
    reg [3:0] ALUIn;
    reg [63:0] Readdata;
    reg zr;
    reg [63:0] ALUout;
    reg [6:0] opcode;
    reg [63:0] ALUY;
   
    reg clk, reset;
  
    initial begin 
    
      reset = 1;
      #3
      reset = 0;
      clk = 0;
      #32

      repeat(360) begin
	#3
	clk = ~clk; 
      end
    
    end
  
  
    PC pc_inst(
        .clk(clk), 
        .reset(reset),
        .in(pc_in),
        .out(pc_out)         
    );

    InstMem mem(
        .address(pc_out),
        .instruction(instruction)
    );

    Control control_unit(
        .(opcode),
        .ALUsrc(ALUinstructionsrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    RegFile reg_file(
        .clk(clk),
        .instruction(instruction),
        .RegWrite(RegWrite),
        .WriteData(WriteData),
        .Readdata1(Readdata1),
        .Readdata2(Readdata2)
    ); 

    ImmGen imm(
        .instruction(instruction),
        .out(imm_out)
    );

    ALUControl control_alu(
        .instruction(instruction),
        .ALUOp(ALUOp),
        .ALUIn(ALUIn)
    );
    
    ALU alu(
        .clk(clk),
        .x(Readdata1),
        .y(ALUY),
        .src(ALUIn),
        .out(ALUout),
        .zr(zr)
    );

    Memory memory(
        .clk(clk),
        .address(ALUout),
        .WriteData(Readdata2),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Readdata(Readdata)
    );

    assign WriteData = MemtoReg ? Readdata : ALUout;
    assign ALUY = ALUsrc ? imm_out : Readdata2;
    assign opcode = instruction[6:0];
    assign pc_in = (zr & Branch) ? (pc_out + (imm_out<<1)) : pc_out + 4;
  

endmodule
