`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Abdelrahman Khaled
// Create Date: 05/28/2025 02:37:03 AM
// Module Name: aes_shift_rows
// Project Name: AES 
// Description:As each row of the state is cyclically shifted to the left, 
//            depending on the row index. 
 
//////////////////////////////////////////////////////////////////////////////////


module aes_shift_rows(
input        [127:0] i_aes_shift_rows_data_in,
input                clk,
input                rst_n,
output  reg  [127:0] o_aes_shift_rows_data_out 
    );
    
    always @(posedge clk or negedge rst_n)
    begin
      if(!rst_n)
      begin
        o_aes_shift_rows_data_out <= 128'h0;
      end
      else 
      begin

         // First row (r = 0) is not shifted

    o_aes_shift_rows_data_out[127:120]<= i_aes_shift_rows_data_in [127:120]   ;
    o_aes_shift_rows_data_out[95:88]  <= i_aes_shift_rows_data_in [95:88]   ;
    o_aes_shift_rows_data_out[63:56]  <= i_aes_shift_rows_data_in [63:56]   ;
    o_aes_shift_rows_data_out[31:24]  <= i_aes_shift_rows_data_in [31:24] ;

     // Second row (r = 1) is cyclically left shifted by 1 offset
    
     o_aes_shift_rows_data_out[119:112]<= i_aes_shift_rows_data_in [87:80]   ;
     o_aes_shift_rows_data_out[87:80]  <= i_aes_shift_rows_data_in [55:48]   ;
     o_aes_shift_rows_data_out[55:48]  <= i_aes_shift_rows_data_in [23:16] ;
     o_aes_shift_rows_data_out[23:16]  <= i_aes_shift_rows_data_in [119:112]   ;
         
     // Third row (r = 2) is cyclically left shifted by 2 offsets
     o_aes_shift_rows_data_out[111:104]<= i_aes_shift_rows_data_in [47:40]    ;
     o_aes_shift_rows_data_out[79:72]  <= i_aes_shift_rows_data_in [15:8] ;
     o_aes_shift_rows_data_out[47:40]  <= i_aes_shift_rows_data_in [111:104]   ;
     o_aes_shift_rows_data_out[15:8]   <= i_aes_shift_rows_data_in [79:72]   ;
      
     // Fourth row (r = 3) is cyclically left shifted by 3 offsets 
     o_aes_shift_rows_data_out[7:0]    <= i_aes_shift_rows_data_in [39:32]     ;
     o_aes_shift_rows_data_out[39:32]  <= i_aes_shift_rows_data_in [71:64]   ;
     o_aes_shift_rows_data_out[71:64]  <= i_aes_shift_rows_data_in [103:96]   ;
     o_aes_shift_rows_data_out[103:96] <= i_aes_shift_rows_data_in [7:0]  ;
    
             
      end
    
    end
    
    
    
    
endmodule
