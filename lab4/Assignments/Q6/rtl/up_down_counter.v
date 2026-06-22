`timescale 1ns/1ps

module up_down_counter(
input clk,rst,load,logic,
input [3:0]data_in,
output reg [3:0]data_out 
);

always@(posedge clk)
begin
if(rst)

data_out <= 4'b0000;

else if(load)

data_out <= data_in;

else if( logic==1'b1)

data_out <= data_out +1'b1;

else if(logic ==1'b0)

data_out<=data_out-1'b1;

else if(data_out == 4'b1011)

data_out <= 4'b0000;

else if(data_out == 4'b0000)

data_out <= 4'b1011;

end 
endmodule 