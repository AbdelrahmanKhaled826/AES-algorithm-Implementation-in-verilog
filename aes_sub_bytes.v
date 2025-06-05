`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abdelrahman Khaled 
// Create Date: 05/27/2025 04:31:25 PM
// Module Name: aes_sub_bytes
// Project Name: AES
// Description:  To replace a byte with a value in S-box we have 
//to instantiate the S-box inside our Sub-byte module.
//////////////////////////////////////////////////////////////////////////////////


module aes_sub_bytes(
input      [127:0]  i_aes_sub_bytes_data_in,
output     [127:0]  o_aes_sub_bytes_s_data_out
    );
    
    genvar i;
    generate 
      for(i=0; i<127 ; i=i+8)begin
        aes_sbox u_aes_sbox(
                  .i_aes_sbox_data_in(i_aes_sub_bytes_data_in[i+7:i]),
                  .o_aes_sbox_data_out(o_aes_sub_bytes_s_data_out[i+7:i])
          );
      end
    
    endgenerate
    
    
    
endmodule
