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

# 📁 The schematic of AES structure
![image](https://github.com/user-attachments/assets/e319a2a7-d239-4e44-94ac-0ef88f8fb584)

# 🛠️ Steps
Add round key
Substitute bytes
Shift rows
Mix columns

# 🧪 Testing
### 🧾 Test Input
Signal	Value        (Hex)
______________________________________________________________________________________
Plain   Text        3243f6a8885a308d313198a2e0370734
______________________________________________________________________________________
AES Key (128-bit)    2b7e151628aed2a6abf7158809cf4f3c

### ✅ Expected Output
Output	   Value          (Hex)
______________________________________________________________________________________
Encrypted  Data (AES-128)	3925841d02dc09fbdc118597196a0b32 ✔️

This matches the known AES-128 test vector result defined in the FIPS-197 standard.

