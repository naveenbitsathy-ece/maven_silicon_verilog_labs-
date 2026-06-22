module siso_4bit(
  input clk,rst,en,
input data_in,
output reg data_out
);
integer i;
  reg [3:0]siso;
always@(posedge clk)
begin
    if(rst)
    begin
      data_out<=0;
        for(i=0;i<4;i=i+1)
         siso[i]=0;
    end
    else 
      begin
        if(en)
          begin
            siso[0]<=data_in;
            siso[1]<=siso[0];
            siso[2]<=siso[1];
            siso[3]<=siso[2];
            data_out<= siso[3];
          end
          end 
end 
endmodule 
