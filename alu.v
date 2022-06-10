`timescale 1ns / 1ps
//////////////////////////////////


module alu(
    input [7:0] op1,
    input [7:0] op2,
    input [3:0] op_code,
    output reg [7:0] out,
    output reg ef,
    output reg zf
    );
    
    always @ (*)
        begin
            case(op_code)
            4'b0000 :  out = op1 + op2;
            4'b0001 :  out = op1 - op2;
            4'b0010 :  out = op1 & op2;
            4'b0011 :  out = op1 || op2;
            4'b0100 :  out = op1 ^ op2;
            4'b0101 :  out = op1 &~ op2;
            4'b0110 :  out = op1 |~ op2;
            4'b0111 :  out = op1 ^~ op2;
            4'b1000 :  out = op1;
            4'b1001 :  out = op2;
            4'b1010 :  out = op1 << op2;
            4'b1011 :  out = op1 >> op2;
            default : out = 0;
            endcase 
            
            if(op1 == op2)  ef = 1;
                else  ef = 0;
            if(out == 0)  zf = 1;
                else  zf = 0;    
        end
    
    
endmodule
