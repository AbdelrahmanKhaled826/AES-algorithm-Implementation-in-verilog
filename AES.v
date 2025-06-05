`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abdelrahman khaled
// Module Name: AES
// Project Name:AES 
// Description: This is the top module to produce the final AES encryption output. 
//////////////////////////////////////////////////////////////////////////////////


module AES(
input  [127:0]  i_AES_plain_text,
input  [127:0]  i_AES_key_in,
input           i_AES_clk,
input           i_AES_rst_n,
output [127:0]  o_AES_data_encrypted
 );
 
 wire [127:0] key_0,key_1,key_2,key_3,key_4,key_5,
              key_6,key_7,key_8,key_9,key_10;
             
 wire [127:0] round_1_data_out,round_2_data_out,round_3_data_out,
              round_4_data_out,round_5_data_out,round_6_data_out,
              round_7_data_out,round_8_data_out,round_9_data_out,
              round_10_data_out;
              
 wire [127:0] round_1_data_in;
 
 assign round_1_data_in = i_AES_key_in ^ i_AES_plain_text;
                           
aes_key_generation u_aes_key_generation(
 .i_aes_key_generation_input_key(i_AES_key_in),
 .o_aes_key_generation_key_0(key_0),
 .o_aes_key_generation_key_1(key_1),
 .o_aes_key_generation_key_2(key_2),
 .o_aes_key_generation_key_3(key_3),
 .o_aes_key_generation_key_4(key_4),
 .o_aes_key_generation_key_5(key_5),
 .o_aes_key_generation_key_6(key_6),
 .o_aes_key_generation_key_7(key_7),
 .o_aes_key_generation_key_8(key_8),
 .o_aes_key_generation_key_9(key_9),
 .o_aes_key_generation_key_10(key_10)
 );
 
 
 aes_round u1_aes_round(
 .i_aes_round_data_in(round_1_data_in),
 .i_aes_round_key_in(key_1),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_1_data_out) 
 );
 
 aes_round u2_aes_round(
 .i_aes_round_data_in(round_1_data_out),
 .i_aes_round_key_in(key_2),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_2_data_out) 
 );
  
 aes_round u3_aes_round(
 .i_aes_round_data_in(round_2_data_out),
 .i_aes_round_key_in(key_3),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_3_data_out) 
 );
 
  
 aes_round u4_aes_round(
 .i_aes_round_data_in(round_3_data_out),
 .i_aes_round_key_in(key_4),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_4_data_out) 
 );
 
  
 aes_round u5_aes_round(
 .i_aes_round_data_in(round_4_data_out),
 .i_aes_round_key_in(key_5),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_5_data_out) 
 );
 
  
 aes_round u6_aes_round(
 .i_aes_round_data_in(round_5_data_out),
 .i_aes_round_key_in(key_6),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_6_data_out) 
 );
 
  
 aes_round u7_aes_round(
 .i_aes_round_data_in(round_6_data_out),
 .i_aes_round_key_in(key_7),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_7_data_out) 
 );
 
  
 aes_round u8_aes_round(
 .i_aes_round_data_in(round_7_data_out),
 .i_aes_round_key_in(key_8),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_8_data_out) 
 );
 
  
 aes_round u9_aes_round(
 .i_aes_round_data_in(round_8_data_out),
 .i_aes_round_key_in(key_9),
 .i_aes_round_clk(i_AES_clk),
 .i_aes_round_rst_n(i_AES_rst_n),
 .o_aes_round_data_out(round_9_data_out) 
 );
 
 aes_last_round u10_aes_last_round(
 .i_aes_last_round_data_in(round_9_data_out),
 .i_aes_last_round_key_in(key_10),
 .i_aes_last_round_clk(i_AES_clk),
 .i_aes_last_round_rst_n(i_AES_rst_n),
 .o_aes_last_round_data_out(o_AES_data_encrypted) 
  );
 
  
 
 
 
endmodule
