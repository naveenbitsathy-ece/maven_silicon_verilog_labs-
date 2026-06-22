/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   ram_tb.v   

Description :      Testbench for Single Port RAM

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module ram_dp_tb;
  reg rst;
   reg [7:0] data_in;
wire [7:0] data_out;
   reg  [3:0] wr_addr;
   reg [3:0] rd_addr;
   reg  wr_en,rd_en;
reg clk;
   

   //Instantiate the RAM module and connect the ports
  ram_dp DUT(wr_en,rd_en,
             clk,rst,
         wr_addr,
         rd_addr,
         data_in,
         data_out
);
initial
clk=0;

always
#5 clk=~clk;

  initial 
begin
rst=1;
#10;
  rst=0;
end

task stimula;
input a,b,w,r;
input [7:0]c;
begin
wr_en=a;
rd_en=b;
wr_addr=w;
rd_addr=r;
data_in=c;
#5;
end
endtask 
initial
begin
stimula(1,0,3,0,8'd5);
stimula(0,1,0,3,8'd5);
stimula(1,0,3,0,8'd7);
end 

initial
begin
  $monitor (" Time=%0t  rst=%b  wr_en=%b rd_en=%b rd_addr=%b wr_addr=%b data_in = %b  data_out=%b",$time,rst,wr_en,
rd_en,rd_addr,wr_addr,data_in,data_out);
end
endmodule 