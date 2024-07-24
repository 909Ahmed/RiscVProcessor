module InstMem#(parameter BITS = 32)(

    input [63:0] address, 
    output reg [BITS-1:0] instruction

);
    
  reg [31:0] MEM [32768];
  
  initial begin
    
    integer file, i;
    reg check;
    
    file = $fopen("input.txt", "r");
    i = 0;
    
    while (!$feof(file)) begin

      $fscanf(file, "%b\n", MEM[i]);
      i = i + 4;
      
    end

    $fclose(file);
    
  end
  
  assign instruction = MEM[address[14:0]];
  
  
endmodule
