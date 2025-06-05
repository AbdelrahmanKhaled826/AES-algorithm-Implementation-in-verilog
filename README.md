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
## 🧾 Test Input
### Signal Value   
______________________________________________________________________________________
PlainText:  3243f6a8885a308d313198a2e0370734

AES Key:  2b7e151628aed2a6abf7158809cf4f3c

### ✅ Expected Output
### Output Value
______________________________________________________________________________________
Encrypted  Data:  3925841d02dc09fbdc118597196a0b32 ✔️

✔️ _This matches the known AES-128 test vector result defined in the FIPS-197 standard_

# 📈 Simulation
The simulation waveform shows successful key expansion and encryption. The result becomes stable after reset and initial processing latency, confirming correct AES round operations.

![image](https://github.com/user-attachments/assets/18abf818-b086-425e-a29e-644eb4b136dd)

# 📊 FPGA Resource Utilization
The AES encryption module was synthesized using Vivado v2018.2 targeting the Xilinx Virtex-7 (7vx485tffg1157-1) device. The results below reflect resource usage post-synthesis.
![image](https://github.com/user-attachments/assets/3fe47344-bb22-4878-a808-96810f130496)


