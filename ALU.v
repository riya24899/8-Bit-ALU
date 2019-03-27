//Assuming unsigned numbers
//Riya Singh
//2017309
`timescale 1ns/1ps

module alu(
           A, B, SL, Su, C, Z, S, P 
  );
    
    input [7:0] A;
    input [7:0] B;                  
    input [3:0] SL;
    output [7:0] Su;
    output C;
    output Z;
    output S;
    output P;
   
    reg [8:0] Result; 
    reg Sholder;
    reg Zholder;
    reg Pholder;
    wire [2:0] Ptmp;
    assign Ptmp = Result[0] + Result[1] + Result[2] + Result[3] + Result[4] + Result[5] + Result[6] + Result[7];   
    assign S = Sholder;
    assign P = Pholder;
    assign Su = Result[7:0];
    assign C = Result[8];
    assign Z = Zholder;
    
    always @(*)
    begin
        case(SL)
        4'b0000:
           begin
           Result=9'b00000000;
           end 
        4'b0001:
           begin
           Result = B;
           end
        4'b0010: 
           begin
           Result = ~B;
           end
        4'b0011: 
           begin
           Result = A;
           end
        4'b0100:
           begin
           Result = ~A;
           end
         4'b0101: 
           begin 
           Result = A+1;
           end
         4'b0110:
           begin
           Result = A-1;
           end
         4'b0111: 
           begin
           Result = A<<B;
           Result[8]=Result[7];
           end
          4'b1000:  
           begin
           Result = A + B;
           Sholder=1'b0;
           Zholder=(Result==9'b0000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1001: 
           begin
           Result = A - B;
           Result[8]=~Result[8];
           Sholder=(C==0)?1:0;
           Zholder=(Result[7:0]==8'b000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1010:  
           begin
           Result = A + B + C;
           Sholder=1'b0;
           Zholder=(Result==9'b000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1011:
           begin
           Result = A-B-C;
           Result[8]=~Result [8];
           Sholder=(C==0)?1:0;
           Zholder=(Result[7:0]==8'b000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1100: 
           begin
           Result = A & B;
           Sholder=1'b0;
           Result[8]=1'b0;
           Zholder=(Result[7:0]==8'b000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1101:
           begin
           Result = A | B;
           Sholder=1'b0;
           Result[8]=1'b0;
           Zholder=(Result[7:0]==8'b000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1110: 
           begin
           Result = A^B;
           Result[8]=1'b0;
           Sholder=1'b0;
           Zholder=(Result[7:0]==8'b000000000)?1:0;
           Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
           end
          4'b1111:  
            begin
            Result = A~^B;
            Result[8]=1'b0;
            Sholder=1'b0;
            Zholder=(Result[7:0]==8'b000000000)?1:0;
            Pholder=(Ptmp%2==0)?1:0; //assuming even parity bit
            end

        endcase
    end

endmodule