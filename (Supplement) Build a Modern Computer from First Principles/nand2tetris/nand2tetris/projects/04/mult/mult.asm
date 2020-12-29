// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


@R2
M = 0; // set sum = 0

@R1
D = M; 
@i
M = D; // load loop variable

(LOOP)
@i
D = M // D = i
@END
D ; JLE // if i<=0 goto END
@R0
D = M // D = RAM[0]
@R2
M = M + D // sum = sum + 2
@i
M = M -1 // i = i - 1
@LOOP
0;JMP // goto loop  

(END)
0;JMP //infinite loop