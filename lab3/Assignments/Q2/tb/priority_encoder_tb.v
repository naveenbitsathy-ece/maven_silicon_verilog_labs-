module priority_encoder_tb();
  reg d7,d6,d5,d4,d3,d2,d1,d0;
  wire y2,y1,y0,valid;
integer i;
  priority_encoder DUT(d7,d6,d5,d4,d3,d2,d1,d0,y2,y1,y0);

initial 
begin
    d7=1'b0;
    d6=1'b0;
    d5=1'b0;
    d4=1'b0;
    d3=1'b0;
    d2=1'b0;
    d1=1'b0;
    d0=1'b0;
end
initial 
begin
    for(i=0;i<64;i=i+1)
    begin
        {d7,d6,d5,d4,d3,d2,d1,d0}=i;
        #10;
    end
end 
initial
begin
$monitor("Input d7=%b,d6=%b,d5=%b,d4=%b,d3=%b,d2=%b,d1=%b,d0=%b Output y2=%b,y1=%b,y0=%b,valid=%b",d7,d6,d5,d4,d3,d2,d1,d0,y2,y1,y0,valid);
end
initial
 
begin
    #100
    $finish;
end
endmodule 
