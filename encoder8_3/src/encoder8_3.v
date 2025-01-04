`timescale 1ns/1ns
/* verilator lint_off WIDTHTRUNC */
module encoder8_3 #( 
  parameter WIDTH = 8,
            WIDTH_OUT = 3
)
(
  input  [WIDTH-1:0]    D,
  output            reg x,
  output            reg y,
  output            reg z
);

  // 
  reg [WIDTH_OUT-1:0] Q;
  assign {x,y,z} = Q;

  always @(*) begin
	Q = 0; 
    for (int i = 0; i < WIDTH; i = i + 1) begin 
      if (D[i]) begin 
        Q = i;
      end
    end
  end

 endmodule
  
