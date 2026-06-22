module decoder_tb();
reg a,b;
wire y0,y1,y2,y3;
integer i;
decoder DUT (a,b,y0,y1,y2,y3);
initial 
begin
    a=1'b1;
    b=1'b1;
end
initial
 begin
    for(i=0;i<4;i=i+1)
    begin
        {a,b}=i;
        #10;
end
end 
initial 
begin
    $monitor(" Input a=%b,b=%b   Output y0=%b,y1=%b,y2=%b,y3=%b",a,b,y0,y1,y2,y3);
end 
initial
begin
    #100;
    $finish;
end 

endmodule

