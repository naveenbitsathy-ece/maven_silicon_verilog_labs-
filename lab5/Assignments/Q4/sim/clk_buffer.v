// Code your design here
module clk_buffer(
  input clk,
  output data_out
);
   buf b1(data_out,clk);
endmodule
