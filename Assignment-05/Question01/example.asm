; Assignment 5 Question 1
; Author:  Samuel George
; Date:    2/24/2023

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

;constant number variables

number10 DWORD  10
number3 DWORD   3
number7 DWORD   7
number5 DWORD   5




;input variables

prompt1 BYTE    "Enter a number", 0                         ;input prompt for value x
numberX DWORD   ?                                           ;variable for input for value x
string  BYTE    40 DUP (?)




;output variables

resultLbl BYTE  "The results for the obvious method and horners scheme respectively"    ; label to show 

ObviMethod  BYTE    "The value using the obvious method is: "    
answer     BYTE    11 DUP (?), 0ah, 0dh

xxx   BYTE    "The value using horners scheme is: "
answer2    BYTE    11 DUP (?), 0


.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     numberX, eax    ; store in memory

        mov     eax, numberX    ; first number to EAX
        mul     numberx         ; x * x
        mul     numberX         ; x * x * x
        mul     number5         ; 5 * x * x * x


        ;to represent 7*x*x
    
        mov     ebx, number7

        imul    ebx, numberX
        imul    ebx, numberX

        neg     ebx

        ;to represent 3*x

        mov     ecx, number3
        imul    ecx, numberX

        ;time to calculate

        add     ebx, ecx        
        add     eax, ebx
        neg     eax                         ;turning eax into a negative value to add it to a postive value of 10 since its technically -10
        add     eax, number10               ;adding 10 to - value of eax
        neg     eax                         ;setting eax back to positive to get final answer
        


        ;horners scheme method

        ;calculation for (5x-7)
        mov     edx, number5
        imul    edx, numberX
        sub     edx, number7

        ;calculation for ((5x-7) * x+3)
        imul    edx, numberX
        add     edx, number3

        imul    edx, numberX
        sub     edx, number10


        
        dtoa    answer, eax                 ; convert to ASCII characters
        dtoa    answer2, edx             ; convert to ASCII characters


        output  resultLbl, obviMethod           ; output label and sum

       

        mov     eax, 0  ; exit with return code 0


        ret
_MainProc ENDP
END                             ; end of source code

