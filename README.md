# 8-Bit-ALU
A program coded in Verilog to simple ALU functions on 8 bit numbers.

The inputs are applied to a pair of registers (A and B) and the output is loaded to another register (Su). 

The following operations are supported by the 8 bit ALU.

8 Unary operations  [Codes 0 – 7]: 0, B, B’, A, A’ (bit wise complementing), A Plus 1, A Minus 1, 2n ∗ A (Shift Left by n bits (stored in Register B), C ← MSB after the shift). 
4 Arithmetic Operations  [Codes8–B]: A Plus B, A Minus B, A Plus B Plus C, A Minus B Minus C.
C is the carry input and is 1 bit long 
4 Logic Operations  [Codes C – F]: A AND B, A OR B, A XOR B, (A XOR B)’ (Logic Operations are bit wise operations)
The ALU generates 4 flags – Zero (Z), Carry (C), Sign (S) and Parity (P). Flags are not affected by the Unary Logic functions. Only the C flag is affected by the Shift function. All flags are affected by the other ALU functions. 

