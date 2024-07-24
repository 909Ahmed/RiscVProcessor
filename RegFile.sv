module RegFile(
  
  input clk,
  input [31:0] instruction,
  input RegWrite,
  input [63:0] WriteData,
  output reg [63:0] Readdata1,
  output reg [63:0] Readdata2
  
);

  reg [63:0] regs [31:0];
  integer index;
  
  initial begin
    
    regs[0] = 0;
    regs[1] = 10;
    regs[2] = 45;
    regs[3] = 1;
    regs[4] = 0;
    regs[5] = 0;
    regs[6] = 0;
    regs[7] = 0;
    regs[8] = 0;
    regs[9] = 0;
    regs[10] = 0;
    regs[11] = 0;
    regs[12] = 0;
    regs[13] = 0;
    regs[14] = 0;
    regs[15] = 0;
    regs[16] = 0;
    regs[17] = 0;
    regs[18] = 0;
    regs[19] = 0;
    regs[20] = 0;
    regs[21] = 0;
    regs[22] = 0;
    regs[23] = 0;
    regs[24] = 0;
    regs[25] = 0;
    regs[26] = 0;
    regs[27] = 0;
    regs[28] = 0;
    regs[29] = 0;
    regs[31] = 0;
    
    regs[30] = -1;
    
  end
  
  always @(posedge(clk)) begin
    
    if (RegWrite) begin
     // index = ;
      regs[instruction[11:7]] = WriteData;
    end 
    
    $display("%d ", regs[7]);
    
  end
  
  assign Readdata1 = regs[instruction[19:15]];
  assign Readdata2 = regs[instruction[24:20]];
  
  
endmodule
