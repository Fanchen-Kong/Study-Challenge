// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(FOREVER) 
@KBD
D = M // read keyboard

@WHITE
D ; JEQ // goto white if keyboard is zero

@BLACK
D ; JNE // goto black if keyborad is typing


(WHITE)
@i
M = 0 // set loop var to 0
(WHITELOOP)
@i 
D = M // read the loop var D = i
@8191
D = D - A // D = i - 8191
@FOREVER
D ; JGT // if (i-8191) > 0 goto forever
@i
D = M // D = i
@SCREEN
A = A + D // A = A + i 
M = 0 // RAM(16384+i) = 0x0000 set pixel to white
@i
M = M + 1 // i = i+1
@WHITELOOP
0 ; JMP   // goto loop

(BLACK)
@i
M = 0 // set loop var to 0
(BLACKLOOP)
@i 
D = M // read the loop var D = i
@8191
D = D - A // D = i - 8191
@FOREVER
D ; JGT // if (i-8191) > 0 goto forever
@i
D = M // D = i
@SCREEN
A = A + D // A = A + i 
M = -1 // RAM(16384+i) = 0xFFFF set pixel to black
@i
M = M + 1 // i = i+1
@BLACKLOOP
0 ; JMP   // goto loop