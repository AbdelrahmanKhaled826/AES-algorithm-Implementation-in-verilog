`timescale 1ns / 1ps


module aes_mix_column_tb ;

//reg clk;
//reg rst_n;
reg [127:0]  i_aes_mix_column_data_in;
wire[127:0]  o_aes_mix_column_data_out;

aes_mix_column u_aes_mix_column(
 .i_aes_mix_column_data_in(i_aes_mix_column_data_in),
 //.clk(clk),
 //.rst_n(rst_n),
 .o_aes_mix_column_data_out(o_aes_mix_column_data_out)
  );

initial 
begin
$monitor("output=%h",o_aes_mix_column_data_out);
//  clk =1'b0;
//  rst_n=1'b1;
//  #30;
//  rst_n=1'b0;
  
  #30;
  i_aes_mix_column_data_in = 128'h e598271ef11141b8ae52b4e0305dbfd4;
  
  
  
end

//always #5 clk = ~clk;

endmodule
