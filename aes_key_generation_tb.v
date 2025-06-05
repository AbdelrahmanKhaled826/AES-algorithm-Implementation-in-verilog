`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:Abdelrahman Khaled
// Create Date: 06/01/2025 06:30:03 PM
// Module Name: aes_key_generation_tb
//////////////////////////////////////////////////////////////////////////////////


module aes_key_generation_tb ;
 
reg  [127:0] i_aes_key_generation_input_key;
wire [127:0] o_aes_key_generation_key_0;
wire [127:0] o_aes_key_generation_key_1;
wire [127:0] o_aes_key_generation_key_2;
wire [127:0] o_aes_key_generation_key_3;
wire [127:0] o_aes_key_generation_key_4;
wire [127:0] o_aes_key_generation_key_5;
wire [127:0] o_aes_key_generation_key_6;
wire [127:0] o_aes_key_generation_key_7;
wire [127:0] o_aes_key_generation_key_8;
wire [127:0] o_aes_key_generation_key_9;
wire [127:0] o_aes_key_generation_key_10;
    
    
   aes_key_generation u_aes_key_generation(
   .i_aes_key_generation_input_key(i_aes_key_generation_input_key),
   .o_aes_key_generation_key_0(o_aes_key_generation_key_0),
   .o_aes_key_generation_key_1(o_aes_key_generation_key_1),
   .o_aes_key_generation_key_2(o_aes_key_generation_key_2),
   .o_aes_key_generation_key_3(o_aes_key_generation_key_3),
   .o_aes_key_generation_key_4(o_aes_key_generation_key_4),
   .o_aes_key_generation_key_5(o_aes_key_generation_key_5),
   .o_aes_key_generation_key_6(o_aes_key_generation_key_6),
   .o_aes_key_generation_key_7(o_aes_key_generation_key_7),
   .o_aes_key_generation_key_8(o_aes_key_generation_key_8),
   .o_aes_key_generation_key_9(o_aes_key_generation_key_9),
   .o_aes_key_generation_key_10(o_aes_key_generation_key_10)
    );
    
    initial
    begin
      i_aes_key_generation_input_key = 128'h 2b7e151628aed2a6abf7158809cf4f3c;
    end
       
endmodule
