; Assignment-07 Question02
; Author:  Samuel George
; Date:    3/17/23

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
nbrArray DWORD  25, 47, 15, 50, 32

string  BYTE    40 DUP (?)
resultLbl BYTE  "The sum of the array is", 0
sum BYTE    11 DUP (?), 0

.CODE
_MainProc PROC



        push    ebp
        mov     ebp, esp
        sub     esp, 4

        lea     eax, nbrArray           ; address of array
        push    eax                     ; push pointer to array
        push    5                       ; push size of array
        call    _arraySumProc           ; call the procedure we made for the array
                

        mov     eax, ebx
        
        ;main procedure is displaying the sum using output macro

        dtoa    sum, eax                ; convert to ASCII characters
        output  resultLbl, sum          ; output label and sum
        

        mov     eax, 0                  ; exit with return code 0
        mov     esp, ebp
        pop     ebp



        ret
_MainProc ENDP



        ;addition procedure

_arraySumProc PROC

        push    ebp
        mov     ebp, esp
        ;push    esi
        ;push    edi


        mov     esi, DWORD PTR [ebp + 8]    ; pointer to array
        mov     edi, DWORD PTR [ebp + 12]   ; size of array

        mov     eax, 0                      ; initialize sum to 0
        mov     ecx, edi                    

        cmp     edi, 0                      ; check if size is valid
        jle     _exit                       ; if the array has a negative or zero length size 

_addition:                                  ; run loop if the array has a positive length... we hardcoded the array so we should be good
        add     eax, DWORD PTR esi
        add     esi, 4
        dec     ecx                         ; decreased by 4 since that is the increment
        jnz     _addition                   ; to continue addition if not zero... until the array has added all values in its length

_exit:
        pop     edi
        pop     esi
        mov     esp, ebp
        pop     ebp

        ret

_arraySumProc ENDP

END                             ; end of source code

