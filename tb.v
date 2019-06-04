`timescale 1ns/1ps
module tb ();

reg clk;
reg rst_n;
reg rst_n_clkn;
reg div_cfg;
wire clk_o;
wire clk_o_new;
initial begin
  clk = 0;
  rst_n = 1'b0;
  rst_n_clkn = 1'b0;
  #2
  @(posedge clk)
  rst_n = 1'b1;
  @(negedge clk)
  rst_n_clkn = 1'b1;
@(posedge clk)
#0.1 div_cfg = 8'h02;
repeat (10) @(posedge clk);
@(posedge clk)
#0.1 div_cfg = 8'h0b;
repeat (50) @(posedge clk);
  #50
  $finish;
end

//initial begin
  
//end
always #0.5 clk = ~clk;  


odd_even_div inst_oe_div (
//input
.clk(clk),
.rst_n(rst_n),
.rst_n_clkn(rst_n_clkn),
.div_cfg(div_cfg),
// output
.clko(clk_o_new),
done()
);
