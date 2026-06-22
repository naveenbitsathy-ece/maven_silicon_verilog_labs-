
module fifo_8bit(
    input clk,rst,
  //  input wr_en,rd_en,
    input[7:0]data_in,
    output reg [7:0]data_out
);
reg [7:0]fifo[15:0];
reg wr_ptr,rd_ptr;
reg [15:0]count;
integer i;
always@(posedge clk or negedge rst)
begin
    if(!rst) 
    begin
        data_out<=8'b0;
        for(i=0;i<8;i=i+1)
        fifo[i]=0;
    end
    else
    begin
        if(wr_ptr && !full)
         fifo[wr_ptr]<=data_in;
         wr_ptr=wr_ptr+1;
         count=count+1;
         if(rd_ptr && !empty)
         data_out<=fifo[rd_ptr]; 
         rd_ptr=rd_ptr+1;
         count=count-1;
    end
end 
assign full=(count==15);
assign empty = (count==0);
endmodule 