module ImmGen(
    input [31:0] instruction,
    output reg [63:0] out
);

    assign out = (instruction[6]) ?

                {{52{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8]} :

                (instruction[5]) ? 
                    {{52{instruction[31]}}, instruction[31:20]} : 
                    {{52{instruction[31]}}, instruction[31:25], instruction[11:7]};

endmodule