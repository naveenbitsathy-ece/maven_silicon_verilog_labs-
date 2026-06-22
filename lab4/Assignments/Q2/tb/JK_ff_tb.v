// Code your design here
module JK_ff_tb();
reg j;
reg k;
reg clk;
wire Q;
wire Q_bar;
 
JK_ff DUT(
.clk(clk),
.j(j),
  .k(k),
.Q(Q),
.Q_bar(Q_bar)
);

initial 
clk =1'b0;

always #5 clk=~clk;

initial 
begin

 j=0;k=0; #10;  //hold
j=1;k=0; #10; //set
j=0;k=1; #10; //reset
j=1;k=1; #10; //invalid 
$finish;

end
initial 
begin
$monitor(
"Time =%0t j=%0b k=%0b Q=%0b Q_bar=%0b",
$time,j,k,Q,Q_bar);
end
endmodule   
