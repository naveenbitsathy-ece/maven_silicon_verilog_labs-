// Code your testbench here
// or browse Examples
module clk_buffer_tb();
  reg clk,data_in;
  wire data_out;
  
  clk_buffer DUT(
    clk,data_in,data_out);
  initial 
    clk=0;
  always #5 clk=~clk;
  initial
    begin
  #20
  
  $finish;
        end
  
 initial 
   begin
     $monitor("Time=%0t clk=%b data_out=%b",$time,clk,data_out);
   end
endmodule