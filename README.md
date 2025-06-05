# 🔐 AES Encryption in Verilog
A Verilog-based implementation of the Advanced Encryption Standard (AES) designed for synthesis and simulation using Xilinx Vivado. This implementation supports a 128-bit key. AES-128 bit requires 10 rounds to complete the full operation. The input data is 128 bits and the input key is also 128-bit.

# 🚀 Features
### ✅ AES-128 encryption (ECB mode)
### ✅ Synthesizable Verilog RTL
### ✅ Structured modular design:
Key Expansion
SubBytes
ShiftRows
MixColumns
AddRoundKey
### ✅ Testbench for functional verification
### ✅ Optimized for FPGA synthesis (Vivado)

# 📁 Project Structure

AES/

├── src/

│   ├── aes.v

│   ├── key_generation.v

│   ├── sub_bytes.v

│   ├── shift_rows.v

│   ├── mix_columns.v

│   ├── last_round.v

│   └── round.v

├── tb/

│   └── tb_aes.v

├── README.md
