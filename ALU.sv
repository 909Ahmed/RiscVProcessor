module ALU #(parameter BITS = 64)(clk, x, y, src, out, zr);

  	input clk;
    input  [BITS-1:0] x, y;
	input [3:0] src;
    output reg [BITS-1:0] out;
    output zr;
  
  assign out = (src == 2) ? x + y : (src == 6) ? x - y : (src == 0) ? x & y : x | y;
  assign zr = (out == 0) ? 1 : 0;

endmodule
