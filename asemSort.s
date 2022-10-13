#include <xc.h>

.data  

// String values to sort.
sortString: .asciz "Life is what happens when you're busy making other plans."

.align
// Thus is the vector to sort.
sortVector: .space (0x50 * 4)
            
.text
.align

// Swap stub. Write your swap routine here.
swap:
    
    mov PC,LR  // Return to calling routine. 

/********************************************************************
R0 Value to be written / read.
R1 Base pointer value.
R2 Offset pointer.
    R1 + R2 == the effective address.
R3 Base pointer value.
R4 Offset pointer.
    R3 + R4 == the effective address.
********************************************************************/    
.global asmFunction
asmFunction:    
    ldr R1, = #sortVector
    mov R2, #0
    ldr R3, = #sortString
    mov R4, #0

// Copy the string to a vector of words.
moveChars:            
    ldrb R0, [R3, R4]  
    str R0, [R1, R2]
    add R2,R2, #4
    add R4,R4, #1
    cmp R0, #0
    bne moveChars
 // End of setup.  
 
//  Your sorting code goes here. 
    ldr R1, = #sortVector   // Address of the vector to sort.
    mov R2, #0              // Offset of the vector to sort.

    

// Return to calling routine.            
   mov pc, lr	  
   
.end asmFunction
   
/**********************************************************************/   
.end
           




