; Assignment-07 Question01
; Author:  Samuel George
; Date:    3/16/23

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
number1 DWORD   ?
prompt1 BYTE    "Enter a value to multiply by 2", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The product is", 0
sum     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40     ; read ASCII characters
        atod    string                  ; convert to integer
        mov     number1, eax            ; store in memory

        push    number1
        call    multTwo_proc            ; calling the procedure which multiplies by two
        add     esp, 4                  ; using the number 4 since 4 is the incremement 

        mov     ebx, eax
        dtoa    sum, eax

        ;output for answer

        output  resultLbl, sum


        mov     eax, 0                  ; exit with return code 0
        ret
_MainProc ENDP


multTwo_proc PROC                       ; start of procedure to multiply the value by 2

        push    ebp                     ; save ebp
        mov     ebp, esp                ; setting the frame
        mov     eax, [ebp + 8]
        add     eax, eax                ; multiplies by 2
        pop     ebp                     ; brings back the value

        ret                             ; returns the value of eax
multTwo_proc ENDP

END                             ; end of source code

