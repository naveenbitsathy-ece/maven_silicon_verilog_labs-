
    
module full_adder_tb();
reg a,b,c;
wire sum,carry;
integer i;
full_adder DUT(a,b,c,sum,carry);
initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
end
initial 
begin
    for (i=0;i<8;i=i+1)
    begin
        {a,b,c}=i;
        #10;
    end 
end
initial  
begin 
$monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",a,b,c,sum,carry);
end 
initial
begin
#100;
$finish;
end
endmodule