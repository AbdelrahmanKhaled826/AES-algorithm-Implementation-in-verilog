`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: A bdelrahman Khaled
// Create Date: 05/28/2025 03:24:29 PM
// Module Name: aes_mix_column
// Project Name: AES 
// Description: In mix column block, considering the state matrix 
//             we have to multiply each byte of state matrix with a predefined modulo number
//////////////////////////////////////////////////////////////////////////////////

module aes_mix_column(
input       [127:0]  i_aes_mix_column_data_in,
//input                clk,
//input                rst_n,
output   [127:0]  o_aes_mix_column_data_out
//output reg  [127:0]  o_aes_mix_column_data_out
    );
  
    //reg   [7:0] data_shift;
    /* Multiply by 2 in GF(2^8):
     multiplication by 2 is shifting on bit to the left
     and if the original 8 bits had a 1 @ MSB,
     xor the result with {1b}*/
    function [7:0] mul2_out ; 
    input [7:0] state_byte;
    reg   [7:0] data_shift;
    begin
      data_shift= state_byte << 1;
      mul2_out  = (state_byte[7]==1'b1)? data_shift ^ 8'h1b : data_shift ;
    end
    endfunction
    
    
    /* multiplication by 3:
       multiplication by {02} xor input
      to addition */
     function [7:0] mul3_out ; 
       input [7:0] state_byte;
       begin
         mul3_out  = mul2_out(state_byte) ^ state_byte;
       end
       endfunction
      
            assign o_aes_mix_column_data_out[127:120]   = mul2_out(i_aes_mix_column_data_in[127:120]) ^ mul3_out(i_aes_mix_column_data_in[119:112]) ^ i_aes_mix_column_data_in[111:104]^ i_aes_mix_column_data_in[103:96] ;
            assign o_aes_mix_column_data_out[119:112]  = i_aes_mix_column_data_in[127:120] ^ mul2_out(i_aes_mix_column_data_in[119:112]) ^ mul3_out(i_aes_mix_column_data_in[111:104])^ i_aes_mix_column_data_in[103:96] ;
            assign o_aes_mix_column_data_out[111:104] = i_aes_mix_column_data_in[127:120] ^ i_aes_mix_column_data_in[119:112] ^ mul2_out(i_aes_mix_column_data_in[111:104])^ mul3_out(i_aes_mix_column_data_in[103:96]) ;
            assign o_aes_mix_column_data_out[103:96] = mul3_out(i_aes_mix_column_data_in[127:120]) ^ i_aes_mix_column_data_in[119:112] ^ i_aes_mix_column_data_in[111:104]^ mul2_out(i_aes_mix_column_data_in[103:96]) ;
           
            assign o_aes_mix_column_data_out[63:56 ] = mul2_out(i_aes_mix_column_data_in[63:56]) ^ mul3_out(i_aes_mix_column_data_in[55:48]) ^ i_aes_mix_column_data_in[47:40]^ i_aes_mix_column_data_in[39:32] ;
            assign o_aes_mix_column_data_out[55:48] = i_aes_mix_column_data_in[63:56] ^ mul2_out(i_aes_mix_column_data_in[55:48]) ^ mul3_out(i_aes_mix_column_data_in[47:40])^ i_aes_mix_column_data_in[39:32] ;
            assign o_aes_mix_column_data_out[47:40] = i_aes_mix_column_data_in[63:56] ^ i_aes_mix_column_data_in[55:48] ^ mul2_out(i_aes_mix_column_data_in[47:40])^ mul3_out(i_aes_mix_column_data_in[39:32]) ;
            assign o_aes_mix_column_data_out[39:32] = mul3_out(i_aes_mix_column_data_in[63:56]) ^ i_aes_mix_column_data_in[55:48] ^ i_aes_mix_column_data_in[47:40]^ mul2_out(i_aes_mix_column_data_in[39:32]) ;
           
            assign o_aes_mix_column_data_out[95:88] = mul2_out(i_aes_mix_column_data_in[95:88]) ^ mul3_out(i_aes_mix_column_data_in[87:80]) ^ i_aes_mix_column_data_in[79:72]^ i_aes_mix_column_data_in[71:64] ;
            assign o_aes_mix_column_data_out[87:80] = i_aes_mix_column_data_in[95:88] ^ mul2_out(i_aes_mix_column_data_in[87:80]) ^ mul3_out(i_aes_mix_column_data_in[79:72])^ i_aes_mix_column_data_in[71:64] ;
            assign o_aes_mix_column_data_out[79:72] = i_aes_mix_column_data_in[95:88] ^ i_aes_mix_column_data_in[87:80] ^ mul2_out(i_aes_mix_column_data_in[79:72])^ mul3_out(i_aes_mix_column_data_in[71:64]) ;
            assign o_aes_mix_column_data_out[71:64] = mul3_out(i_aes_mix_column_data_in[95:88]) ^ i_aes_mix_column_data_in[87:80] ^ i_aes_mix_column_data_in[79:72]^ mul2_out(i_aes_mix_column_data_in[71:64]) ;
           
            assign o_aes_mix_column_data_out[31:24]  = mul2_out(i_aes_mix_column_data_in[31:24]) ^ mul3_out(i_aes_mix_column_data_in[23:16]) ^ i_aes_mix_column_data_in[15:8]^ i_aes_mix_column_data_in[7:0] ;
            assign o_aes_mix_column_data_out[23:16] = i_aes_mix_column_data_in[31:24] ^ mul2_out(i_aes_mix_column_data_in[23:16]) ^ mul3_out(i_aes_mix_column_data_in[15:8])^ i_aes_mix_column_data_in[7:0] ;
            assign o_aes_mix_column_data_out[15:8] = i_aes_mix_column_data_in[31:24] ^ i_aes_mix_column_data_in[23:16] ^ mul2_out(i_aes_mix_column_data_in[15:8])^ mul3_out(i_aes_mix_column_data_in[7:0]) ;
            assign o_aes_mix_column_data_out[7:0] = mul3_out(i_aes_mix_column_data_in[31:24]) ^ i_aes_mix_column_data_in[23:16] ^ i_aes_mix_column_data_in[15:8]^ mul2_out(i_aes_mix_column_data_in[7:0]) ;
           
    
    
endmodule
