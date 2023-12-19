; Assignment-06
; Author:  Samuel George
; Date:    3/3/2023

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

;variables

numberX DWORD   ?
numberY DWORD   ?

;prompts



;if statements if answer is less than or equal to 0

invalidLbl  BYTE    "Invalid Input", 0
invalidInfo BYTE    "You can not enter a value less than 0", 0



;basic input for variables

promptX BYTE    "Enter a value for x", 0
promptY BYTE    "Enter a value for y", 0
string  BYTE    40 DUP (?)



;output result for converting it into ASCII

convertAns  BYTE    11 DUP (?), 0



;output for answer

answerVal     BYTE  "The answer of the expression is ", 0
hMeanOut BYTE 3 DUP ('?'), '.', ?, 0


.CODE
_MainProc PROC



        ;input prompt for x and converting it into an integer

        input   promptX, string, 40     ; read ASCII characters
        atod    string                  ; convert to integer
        mov     numberX, eax            ; storing numberX into eax



        cmp     eax, 0                  ; comparing value of eax to 0   
        jnle      validN    
        


        output  invalidLbl, invalidInfo ; output if eax is 0

        jmp     exit


validN:

        ;input prompt for y and converting it into an integer

        input   promptY, string, 40      ; repeat for second number
        atod    string
        mov     numberY, eax

        cmp     eax, 0                  ; comparing value of eax to 0   
        jnle      validN2    
        


        output  invalidLbl, invalidInfo ; output if eax is 0

        jmp     exit

validN2:                                ; code to continue if y is not 0

        ;numerator

        mov     eax, numberX            ; first value into eax, x



        imul    eax, NumberY            ; xy
        imul    eax, 20                  ; 20xy




        ;denominator

        mov     ebx, NumberX
        add     ebx, NumberY


        ;division
        cdq
        idiv    ebx                                  ; dividing eax by ebx, numerator/denominator
        


        dtoa        convertAns, eax                     ; converting eax into a string into the string 'convertAns'


                                                    
        ; 'convertAns' will be the string we copy byte by byte into hMeanOut

        lea     esi, convertAns                     ; loading contents of convertAns into esi
        add     esi, 9                              ; 

        lea     edi, hMeanOut                       ; loading contents of hMeanOut into edi
        add     edi, 2                              ; edi only has 2 index values
        
        mov     al, [esi]                           ; al 3rd Index
        mov     [edi], al                           ;

        dec     esi                                 ;
        dec     edi                                 ;

        mov     al, [esi]                           ; al 2nd Index
        mov     [edi], al

        dec     esi                                 ;
        dec     edi

        mov     al, [esi]                           ; al  1st Index
        mov     [edi], al

        dec     esi                                 ;
        dec     edi

        mov     al, [esi]                           ; al  primary index
        mov     [edi], al        

        lea     esi, convertAns                     ; loading contents of convertAns into esi
        add     esi, 10                              ; 

        lea     edi, hMeanOut                       ; loading contents of hMeanOut into edi
        add     edi, 4                              ; edi only has 2 index values

        mov     al, [esi]                           ; al 3rd Index
        mov     [edi], al                           ;


        output      answerVal, hMeanOut      ;display answer

        
        jmp     exit            


exit:    

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

