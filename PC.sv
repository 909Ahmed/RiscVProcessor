module PC(
    input clk, reset,
    input [63:0] in,
    output reg [63:0] out
);

    reg [63:0] PC = 64'b0;

  always @(posedge(clk), posedge(reset))
    begin

      PC = in;

      if(reset == 1)
            PC = 0;
      out = PC;
      
    end

endmodule