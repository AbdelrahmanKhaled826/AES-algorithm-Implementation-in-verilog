`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Abdelrahman Khaled
// Module Name: aes_round
// Project Name: AES

//////////////////////////////////////////////////////////////////////////////////


module aes_round(
input  [127:0]  i_aes_round_data_in,
input  [127:0]  i_aes_round_key_in,
input           i_aes_round_clk,
input           i_aes_round_rst_n,
output [127:0]  o_aes_round_data_out 

    );
   
  wire  [127:0]  aes_sub_bytes_s_data_out;
  wire  [127:0]  aes_shift_rows_data_out;
  wire  [127:0]  aes_mix_column_data_out; 
    
 aes_sub_bytes u_aes_sub_bytes(
   .i_aes_sub_bytes_data_in(i_aes_round_data_in),
   .o_aes_sub_bytes_s_data_out(aes_sub_bytes_s_data_out)
  );
       
  
 aes_shift_rows u_aes_shift_rows(
    .i_aes_shift_rows_data_in(aes_sub_bytes_s_data_out),
    .clk(i_aes_round_clk),
    .rst_n(i_aes_round_rst_n),
    .o_aes_shift_rows_data_out(aes_shift_rows_data_out) 
  );
           
           
   
  aes_mix_column u_aes_mix_column(
    .i_aes_mix_column_data_in(aes_shift_rows_data_out),
    .o_aes_mix_column_data_out(aes_mix_column_data_out)
  );
               
  assign o_aes_round_data_out = aes_mix_column_data_out ^ i_aes_round_key_in;
                   
    
    
endmodule
