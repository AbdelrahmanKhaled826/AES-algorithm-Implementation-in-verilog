`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Engineer: Abdelrahman khaled
// Create Date: 05/29/2025 05:29:45 PM
// Module Name: aes_key_generation
// Project Name: AES
//////////////////////////////////////////////////////////////////////////////////


module aes_key_generation(

input   [127:0] i_aes_key_generation_input_key,
output  [127:0] o_aes_key_generation_key_0,
output  [127:0] o_aes_key_generation_key_1,
output  [127:0] o_aes_key_generation_key_2,
output  [127:0] o_aes_key_generation_key_3,
output  [127:0] o_aes_key_generation_key_4,
output  [127:0] o_aes_key_generation_key_5,
output  [127:0] o_aes_key_generation_key_6,
output  [127:0] o_aes_key_generation_key_7,
output  [127:0] o_aes_key_generation_key_8,
output  [127:0] o_aes_key_generation_key_9,
output  [127:0] o_aes_key_generation_key_10
    );
    
    //Inside modules are Rcon and subword or generally g matrix and one key expansion mode
    //step1: make a rotword for colum 4
    //step2: make a subbytes from sbox for rotworded
    //step3: make xor with RCON with column 1 
    
    
    wire [31:0] m1_column0,m1_column1,m1_column2,m1_column3;
    wire [31:0] m2_column0,m2_column1,m2_column2,m2_column3;
    wire [31:0] m3_column0,m3_column1,m3_column2,m3_column3;
    wire [31:0] m4_column0,m4_column1,m4_column2,m4_column3;
    wire [31:0] m5_column0,m5_column1,m5_column2,m5_column3;
    wire [31:0] m6_column0,m6_column1,m6_column2,m6_column3;
    wire [31:0] m7_column0,m7_column1,m7_column2,m7_column3;
    wire [31:0] m8_column0,m8_column1,m8_column2,m8_column3;
    wire [31:0] m9_column0,m9_column1,m9_column2,m9_column3;
    wire [31:0] m10_column0,m10_column1,m10_column2,m10_column3;
    wire [31:0] m11_column0,m11_column1,m11_column2,m11_column3;
    
    
    
    wire [31:0] rot_word_m1,rot_word_m2,rot_word_m3,rot_word_m4,
                rot_word_m5,rot_word_m6,rot_word_m7,rot_word_m8,
                rot_word_m9,rot_word_m10;
                
    wire [31:0] key_sub_byte1,key_sub_byte2,key_sub_byte3,
                key_sub_byte4,key_sub_byte5,key_sub_byte6,
                key_sub_byte7,key_sub_byte8,key_sub_byte9,
                key_sub_byte10;            
    
    wire [95:0] dummy_sub_byte1,dummy_sub_byte2,dummy_sub_byte3,
                dummy_sub_byte4,dummy_sub_byte5,dummy_sub_byte6,
                dummy_sub_byte7,dummy_sub_byte8,dummy_sub_byte9,
                dummy_sub_byte10;
    
    wire [31:0] rcon1,rcon2,rcon3,rcon4,rcon5,
                rcon6,rcon7,rcon8,rcon9,rcon10;
    
    
    assign rcon1  = {8'h01,24'b0};
    assign rcon2  = {8'h02,24'b0};
    assign rcon3  = {8'h04,24'b0};
    assign rcon4  = {8'h08,24'b0};
    assign rcon5  = {8'h10,24'b0};
    assign rcon6  = {8'h20,24'b0};
    assign rcon7  = {8'h40,24'b0};
    assign rcon8  = {8'h80,24'b0};
    assign rcon9  = {8'h1b,24'b0};
    assign rcon10 = {8'h36,24'b0};
    
    
    //matrix : m0,m1,m2,m3
    assign m1_column3= i_aes_key_generation_input_key[31:0];
    assign m1_column2= i_aes_key_generation_input_key[63:32];
    assign m1_column1= i_aes_key_generation_input_key[95:64];
    assign m1_column0= i_aes_key_generation_input_key[127:96];
    
    assign m2_column0= m1_column0 ^ key_sub_byte1 ^ rcon1 ;    //4  
    assign m2_column1= m1_column1 ^ m2_column0 ;               //5
    assign m2_column2= m1_column2 ^ m2_column1 ;               //6
    assign m2_column3= m1_column3 ^ m2_column2 ;               //7
    
    assign m3_column0= m2_column0 ^ key_sub_byte2 ^ rcon2 ;  //8
    assign m3_column1= m2_column1 ^ m3_column0 ;            //9
    assign m3_column2= m2_column2 ^ m3_column1 ;            //10
    assign m3_column3= m2_column3 ^ m3_column2 ;            //11
    
    assign m4_column0= m3_column0 ^ key_sub_byte3 ^ rcon3 ; //12
    assign m4_column1= m3_column1 ^ m4_column0 ;
    assign m4_column2= m3_column2 ^ m4_column1 ;
    assign m4_column3= m3_column3 ^ m4_column2 ;
    
    assign m5_column0= m4_column0 ^ key_sub_byte4 ^ rcon4 ; //16
    assign m5_column1= m4_column1 ^ m5_column0 ;
    assign m5_column2= m4_column2 ^ m5_column1 ;
    assign m5_column3= m4_column3 ^ m5_column2 ;
   
    assign m6_column0= m5_column0 ^ key_sub_byte5 ^ rcon5 ;   //20
    assign m6_column1= m5_column1 ^ m6_column0 ;
    assign m6_column2= m5_column2 ^ m6_column1 ;
    assign m6_column3= m5_column3 ^ m6_column2 ;
    
    assign m7_column0= m6_column0 ^ key_sub_byte6 ^ rcon6 ; //24
    assign m7_column1= m6_column1 ^ m7_column0 ;
    assign m7_column2= m6_column2 ^ m7_column1 ;
    assign m7_column3= m6_column3 ^ m7_column2 ;
    
    assign m8_column0= m7_column0 ^ key_sub_byte7 ^ rcon7 ; //28
    assign m8_column1= m7_column1 ^ m8_column0 ;
    assign m8_column2= m7_column2 ^ m8_column1 ;
    assign m8_column3= m7_column3 ^ m8_column2 ;
    
    assign m9_column0= m8_column0 ^ key_sub_byte8 ^ rcon8 ; //32
    assign m9_column1= m8_column1 ^ m9_column0 ;
    assign m9_column2= m8_column2 ^ m9_column1 ;
    assign m9_column3= m8_column3 ^ m9_column2 ;    
   
   assign m10_column0= m9_column0 ^ key_sub_byte9 ^ rcon9 ; //36
   assign m10_column1= m9_column1 ^ m10_column0 ;
   assign m10_column2= m9_column2 ^ m10_column1 ;
   assign m10_column3= m9_column3 ^ m10_column2 ; 
        
   assign m11_column0= m10_column0 ^ key_sub_byte10 ^ rcon10 ; //40
   assign m11_column1= m10_column1 ^ m11_column0 ;
   assign m11_column2= m10_column2 ^ m11_column1 ;
   assign m11_column3= m10_column3 ^ m11_column2 ;      
   
    
 
    assign rot_word_m1 = {m1_column3[23:0],m1_column3[31:24]};
    assign rot_word_m2 = {m2_column3[23:0],m2_column3[31:24]};
    assign rot_word_m3 = {m3_column3[23:0],m3_column3[31:24]};
    assign rot_word_m4 = {m4_column3[23:0],m4_column3[31:24]};
    assign rot_word_m5 = {m5_column3[23:0],m5_column3[31:24]};
    assign rot_word_m6 = {m6_column3[23:0],m6_column3[31:24]};
    assign rot_word_m7 = {m7_column3[23:0],m7_column3[31:24]};
    assign rot_word_m8 = {m8_column3[23:0],m8_column3[31:24]};
    assign rot_word_m9 = {m9_column3[23:0],m9_column3[31:24]};
    assign rot_word_m10= {m10_column3[23:0],m10_column3[31:24]};
    
    
    aes_sub_bytes u1_aes_sub_bytes(
    .i_aes_sub_bytes_data_in({95'h0,rot_word_m1}),
    .o_aes_sub_bytes_s_data_out({dummy_sub_byte1,key_sub_byte1})
     );
    
    aes_sub_bytes u2_aes_sub_bytes(                              
    .i_aes_sub_bytes_data_in({95'h0,rot_word_m2}),              
    .o_aes_sub_bytes_s_data_out({dummy_sub_byte2,key_sub_byte2})
     );

   aes_sub_bytes u3_aes_sub_bytes(                              
   .i_aes_sub_bytes_data_in({95'h0,rot_word_m3}),              
   .o_aes_sub_bytes_s_data_out({dummy_sub_byte3,key_sub_byte3})
    );                                        

    aes_sub_bytes u4_aes_sub_bytes(
    .i_aes_sub_bytes_data_in({95'h0,rot_word_m4}),
    .o_aes_sub_bytes_s_data_out({dummy_sub_byte4,key_sub_byte4})
     );
    
    aes_sub_bytes u5_aes_sub_bytes(                              
    .i_aes_sub_bytes_data_in({95'h0,rot_word_m5}),              
    .o_aes_sub_bytes_s_data_out({dummy_sub_byte5,key_sub_byte5})
     );

   aes_sub_bytes u6_aes_sub_bytes(                              
   .i_aes_sub_bytes_data_in({95'h0,rot_word_m6}),              
   .o_aes_sub_bytes_s_data_out({dummy_sub_byte6,key_sub_byte6})
    );

    aes_sub_bytes u7_aes_sub_bytes(
    .i_aes_sub_bytes_data_in({95'h0,rot_word_m7}),
    .o_aes_sub_bytes_s_data_out({dummy_sub_byte7,key_sub_byte7})
     );
    
    aes_sub_bytes u8_aes_sub_bytes(                              
    .i_aes_sub_bytes_data_in({95'h0,rot_word_m8}),              
    .o_aes_sub_bytes_s_data_out({dummy_sub_byte8,key_sub_byte8})
     );

   aes_sub_bytes u9_aes_sub_bytes(                              
   .i_aes_sub_bytes_data_in({95'h0,rot_word_m9}),              
   .o_aes_sub_bytes_s_data_out({dummy_sub_byte9,key_sub_byte9})
    );                                                            

   aes_sub_bytes u10_aes_sub_bytes(                              
   .i_aes_sub_bytes_data_in({95'h0,rot_word_m10}),              
   .o_aes_sub_bytes_s_data_out({dummy_sub_byte10,key_sub_byte10})
    );    
    
    
    assign o_aes_key_generation_key_0  = {m1_column0 ,m1_column1 ,m1_column2 ,m1_column3 };
    assign o_aes_key_generation_key_1  = {m2_column0 ,m2_column1 ,m2_column2 ,m2_column3 };
    assign o_aes_key_generation_key_2  = {m3_column0 ,m3_column1 ,m3_column2 ,m3_column3 };
    assign o_aes_key_generation_key_3  = {m4_column0 ,m4_column1 ,m4_column2 ,m4_column3 };
    assign o_aes_key_generation_key_4  = {m5_column0 ,m5_column1 ,m5_column2 ,m5_column3 };
    assign o_aes_key_generation_key_5  = {m6_column0 ,m6_column1 ,m6_column2 ,m6_column3 };
    assign o_aes_key_generation_key_6  = {m7_column0 ,m7_column1 ,m7_column2 ,m7_column3 };
    assign o_aes_key_generation_key_7  = {m8_column0 ,m8_column1 ,m8_column2 ,m8_column3 };
    assign o_aes_key_generation_key_8  = {m9_column0 ,m9_column1 ,m9_column2 ,m9_column3 };
    assign o_aes_key_generation_key_9  = {m10_column0,m10_column1,m10_column2,m10_column3};
    assign o_aes_key_generation_key_10 = {m11_column0,m11_column1,m11_column2,m11_column3};
    
endmodule
