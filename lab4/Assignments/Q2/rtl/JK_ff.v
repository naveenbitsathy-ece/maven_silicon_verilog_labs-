module JK_ff(
input  j,k,clk,
output reg Q,
output Q_bar
);
always@(posedge clk)
begin
case({j,k})
 2'b00 : Q<=Q; //hold
2'b01 : Q<=1'b0; //reset
2'b10 : Q<=1'b1; //set
2'b11 : Q<=~Q; //toggle
// default : Q<=0;
endcase
end
assign Q_bar =~Q;
endmodule 