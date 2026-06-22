/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   ram.v   

Description :      Asynchronous Single port Random access memory (16x8)


Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module ram_as(
input rd_en,wr_en,
 input [2:0]rd_addr,
  input[2:0]wr_addr,
input rst,
  input [15:0]data_in,
  output reg [15:0]data_out
);
  reg [15:0]mem[7:0];
integer i;

  always@(*)
begin
if(rst)
begin
for(i=0;i<8;i=i+1)
mem[i]=0;
data_out<=16'd0;
end 
else 
  begin
    if(wr_en)
      mem[wr_addr] <= data_in ;
  
    if(rd_en)
      data_out <= mem[rd_addr];
end
end 
endmodule
