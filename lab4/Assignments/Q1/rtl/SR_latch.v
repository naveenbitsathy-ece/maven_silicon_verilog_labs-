module SR_latch(
 input s,r,
output Q,Q_bar
);
nor G1(Q,r,Q_bar);
nor G2(Q_bar,s,Q);
endmodule
