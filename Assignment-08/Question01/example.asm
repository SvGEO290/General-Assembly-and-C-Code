; Assignment-08
; Author:  Samuel George
; Date:    3/25/2023

.586
.MODEL FLAT


.STACK 4096

.DATA

array1  DWORD 0ff0aff01h, 0ff0bff02h, 0ff0cff03h, 0ff0dff04h, 0ff0eff05h        ;first array
array2  DWORD 002ff0affh, 003ff0bffh, 004ff0cffh, 005ff0dffh, 006ff0effh        ;second array
array3  DWORD 5 dup(?)  ;created 3rd array                                      ;third array made for filling in with contents of first two


.CODE
_MainProc PROC
        
        xor     eax, eax
        mov     ecx, 5

        lea     eax, array1             ;loading array 1 content into eax
        lea     ebx, array2             ;loading array 2 content into ebx
        lea     ecx, array3             ;loading array 3 into ecx
        mov     edx, 5
        call    arrMix                  ; calling procedure for array mix
        mov     eax, 0                  ; exit with return code 0
        
        ret
_MainProc ENDP

arrMix PROC
        ;start of code for arrMix procedure

        ;stack frame starts with pushing ebp, then ebx, then esi, and lastly edi
        push    ebp                     ; start by pushing ebp
        mov     ebp, esp                ;     
        push    ebx                     ; push ebx
        push    esi                     ; push esi
        push    edi                     ; push edi

        mov     ecx, [ebp + 0Ch]        ;count
        mov     esi, [ebp + 8]          ;address of array1
        mov     edi, [ebp + 10h]        ;address of array2
        mov     ebx, [ebp + 14h]        ;address of array3

        xor     eax, eax                ;eax is now cleared up

        ;loop for the arrays

arrloop:                                ;creation of for loop for arrmix procedure

        mov     eax, [esi]
        and     eax, 0x00ff00ff         ; also moves 0x00ff00ff into eax
        shl     eax, 8                  ; shifting to left
        mov     edx, [edi]
        and     edx, 0xFF00FF00
        shr     edx, 8
        or      eax, edx
        mov     [ebx], eax
        add     esi, 4
        add     edi, 4
        add     ebx, 4
        
        loop    arrloop                 ;repeats for all arrays elements


        ;start of the end of stackframe
        pop     edi
        pop     esi
        pop     ebx
        mov     esp, ebp                ;moving the contents back from how it was originally moved.
        pop     ebp
        ;stack frame ends with popping edi, esi, ebx, and then lastly ebp... the opposite of how the stackframe started

        ret
arrMix ENDP

END                             ;end of source code
