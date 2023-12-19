; Explain what this program does
; Author:  Your name
; Date:    put the date

.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

INCLUDE io.h			; header file for input/output

.DATA                   ; reserve storage for data
x	DWORD		?
y	DWORD		?
z	DWORD		?

prompt1 BYTE	"Enter a value for x", 0
prompt2 BYTE	"Enter a value for y", 0
prompt3	BYTE	"Enter a value for z", 0
answerprompt	BYTE	"The answer is", 0
anwerVal		BYTE	11 DUP (?), 0


.CODE					; start of main code
main	PROC
		input	prompt1, x, 40			; read ASCII characters
		atod	x						; convert to integer
		mov		eax, x					; result: = x

		input	prompt1, y, 40			; read ASCII char
		atod	y						; convert to integer
		add		eax, y					; result

		input	prompt1, z, 40			; read ASCII char
		atod	z						;convert to integer
		mov		ebx, z					;store in memory for later

		sub		eax, ebx				; subtracting the var z stored in ebx from eax, which consists of (x+y)
		inc		eax
		neg		eax

		dtoa	answerVal, eax			; moving the value of ((x + y)-z) from EAX into answerVal

		ouput answerprompt, answerVal			;oupt the answer prompt and the answerVal

		ret

main ENDP
END										; end of source code