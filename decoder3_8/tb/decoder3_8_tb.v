`timescale 1ns/1ns
/* verilator lint_off WIDTHTRUNC */
module decoder3_8_tb ();
  parameter WIDTH_IN = 3,
            WIDTH_OUT = 8;

  wire [WIDTH_OUT-1:0] Y_out;
  reg  [WIDTH_IN-1:0] A_in;

  initial begin 
    $dumpfile ("wave.vcd");
    $dumpvars (0,dut);
  end

  decoder3_8 #(
    .WIDTH_IN   (WIDTH_IN),
    .WIDTH_OUT  (WIDTH_OUT)
  ) dut (
    .A_in   (A_in),
    .Y_out  (Y_out)
  );

  initial begin 
    $display ("Starting simulate...");
    A_in = 3'b000; 
    #1;
    if (Y_out == 8'b00000001)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b001; 
    #1;
    if (Y_out == 8'b00000010)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b010; 
    #1;
    if (Y_out == 8'b00000100)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b011; 
    #1;
    if (Y_out == 8'b00001000)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b100; 
    #1;
    if (Y_out == 8'b00010000)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b101; 
    #1;
    if (Y_out == 8'b00100000)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b110; 
    #1;
    if (Y_out == 8'b01000000)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
    //
    A_in = 3'b111; 
    #1;
    if (Y_out == 8'b10000000)  $display ("Passed Result Y = %b",Y_out); 
    else $error;
    #10;
  $stop;
  end
endmodule 
    
