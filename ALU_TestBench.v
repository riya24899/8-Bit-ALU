//Assuming unsigned numbers
//Riya Singh
//2017309
`timescale 1ns/1ps

module ALU_TestBench;
  reg [7:0] A,B;
  reg [3:0] SL;
  wire [7:0] Su;
  wire C, Z, P, S;
  integer i;

   alu ALU (A, B, SL, Su, C, Z, S, P );
   
   initial
     begin
    
    A=8'b10010011;
    B=8'b00000010;
    SL=4'b0000;
    #100;
    
    SL=4'b0001;
    #100;
    
    SL=4'b0010;
    #100;
    
    SL=4'b0011;
    #100;

    SL=4'b0100;
    #100;
    
    SL=4'b0101;
    #100;
    
    SL=4'b0110;
    #100;
    
    SL=4'b0111;
    #100;
    
    SL=4'b1000;
    #100;
    
    SL=4'b1001;
    #100;
    
    SL=4'b1010;
    #100;
    
    SL=4'b1011;
    #100;

    SL=4'b1100;
    #100;
    
    SL=4'b1101;
    #100;
    
    SL=4'b1110;
    #100;
    
    SL=4'b1111;
    #100;    
    
    $stop;
   end
   endmodule