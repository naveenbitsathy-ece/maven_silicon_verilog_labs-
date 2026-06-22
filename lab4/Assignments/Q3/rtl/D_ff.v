module D_ff(

    input clk,      // Clock input
    input d,        // Data input
  input reset ,     //reset 
    output reg q,   // Main output
    output qb       // Complement output

);

// On every positive edge of clock
always @(posedge clk)
begin
 if(reset)
q<=1'b0;
else
    
q <= d; // Store D into Q

end

// Generate complement output
assign qb = ~q;

endmodule