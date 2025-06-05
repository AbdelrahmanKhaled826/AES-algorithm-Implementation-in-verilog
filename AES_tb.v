`timescale 1ns / 1ps

module AES_tb;

reg  [127:0]  i_AES_plain_text;
reg  [127:0]  i_AES_key_in;
reg           i_AES_clk;
reg           i_AES_rst_n;
wire [127:0]  o_AES_data_encrypted;

AES U_AES(
.i_AES_plain_text(i_AES_plain_text),
.i_AES_key_in(i_AES_key_in),
.i_AES_clk(i_AES_clk),
.i_AES_rst_n(i_AES_rst_n),
.o_AES_data_encrypted(o_AES_data_encrypted)
 );
 
 initial
 begin
 $monitor("o_AES_data_encrypted = %h",o_AES_data_encrypted);
 i_AES_clk = 0;
 i_AES_rst_n=1;
 #9
 i_AES_rst_n=0;
 #5
 i_AES_rst_n=1;
 #5 
 i_AES_plain_text=128'h3243f6a8885a308d313198a2e0370734;   
 i_AES_key_in    =128'h2b7e151628aed2a6abf7158809cf4f3c;
 
 
 
 end
 
 always #5 i_AES_clk =~i_AES_clk;
endmodule
