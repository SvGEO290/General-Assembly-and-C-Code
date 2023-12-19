; Explain what this program does
; Author:  Your name
; Date:    put the date

.586
.MODEL FLAT

INCLUDE io.h

.STACK  4096            ; reserve 4096-byte stack


.DATA                   ; reserve storage for data
prompt1		BYTE "Enter grade 1:", 0
prompt2		BYTE "Enter grade 2:", 0
prompt3		BYTE "Enter grade 3:", 0
title		BYTE "Grade Calculator", 0
promptSum	BYTE "Sum:", 0
promptAverage	BYTE "Average:", 0
sum			DWORD 0
average		DWORD 0
grade1		DWORD ?
grade2		DWORD ?
grade3		DWORD ?
string		BYTE	40 DUP (?)

.CODE					; start of main code
main	PROC
		output	title

		input	prompt1, grade1, 40
		atod	grade1


		input	prompt2, grade2, 40
		atod	grade2

		input	prompt3, grade3, 40
		atod	grade3

		mov		eax, grade1
		add		eax, grade2
		add		eax, grade3

		mov		sum, eax
		mov		ebx, 3			; moving 3 into ebx so we can divide eax by ebx to get the average.
		idiv	ebx		
		mov average, eax		; after diving eax by ebx, we are moving it into average

		output promptSum, sum
		output promptAverage, average


		
		

		ret

main ENDP
END