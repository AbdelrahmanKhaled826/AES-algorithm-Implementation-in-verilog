`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/27/2025 04:42:33 PM
// Module Name: aes_sub_bytes_tb
//////////////////////////////////////////////////////////////////////////////////


module aes_sub_bytes_tb;

reg [127:0]  i_aes_sub_bytes_data_in;
wire [127:0]  o_aes_sub_bytes_s_data_out;

aes_sub_bytes u_aes_sub_bytes (
               .i_aes_sub_bytes_data_in(i_aes_sub_bytes_data_in),
               .o_aes_sub_bytes_s_data_out(o_aes_sub_bytes_s_data_out)
 );
 
 reg flag;
 
initial 
begin
flag =1'b0;
 $monitor("input= %h , output= %h",i_aes_sub_bytes_data_in,o_aes_sub_bytes_s_data_out);
 i_aes_sub_bytes_data_in =128'h_193de3be_a0f4e22b_9ac68d2a_e9f84808;
 #1;
 if (o_aes_sub_bytes_s_data_out =='hd42711aee0bf98f1b8b45de51e415230)begin
   flag =1'b1;
   end
   else begin
   flag =1'b0;
   end
 #10;
 i_aes_sub_bytes_data_in =128'hffeeddcc_bbaa9988_77665544_33221100;
 #1;
 if (o_aes_sub_bytes_s_data_out =='h1628c14beaaceec4f533fc1bc3938263)begin
    flag =1'b1;
    end
    else begin
    flag =1'b0;
    end
 
 
 #10;
 $finish;



end
 
 

endmodule
