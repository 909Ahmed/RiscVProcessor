module Memory(
  
  input clk,
   
  input [63:0] address,
  input [63:0] WriteData,

  input MemRead,
  input MemWrite,
  
  output reg [63:0] Readdata
  
);

  reg [63:0] mem [32768];
  integer index;
  
  always @(posedge(clk)) begin
    
//    index = address;
        
    if(MemWrite)
      mem[address[14:0]] = WriteData;
    
  end
  
  assign Readdata = MemRead ? mem[address[14:0]] : 3459;
  
endmodule
