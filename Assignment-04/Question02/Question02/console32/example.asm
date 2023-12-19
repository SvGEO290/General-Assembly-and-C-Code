; Explain what this program does
; Author:  Your name
; Date:    put the date

.586
.MODEL FLAT

INCLUDE io.h

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
prompt1 BYTE	"Enter length: ", 0
prompt2	BYTE	"Enter width: ", 0
prompt3	BYTE	"Enter height: ", 0
result	BYTE	"The volume is: ", 0
length	DWORD	?
width	DWORD	?
height	DWORD	?
volume	DWORD	?
promptVol	BYTE	"The volume is:", 0

.CODE					; start of main code
main	PROC
		input	prompt1, length, 40		; read ASCII characters for length input
		atod	length					; convert to integer		

		input	prompt2, width, 40		; read ASCII characters for width input
		atod	width					; convert to integer

		input	prompt3, height, 40		; read ASCII characters for height input
		atod	height					; convert to integer

		;multiplication for the volume

		mov		eax, length		; moving the length input into eax
		imul	width			; multiplying the width by eax, and length is in eax
		imul	height			; multiplying the height by the product of the width and length because its in eax
		mov		volume, eax

		output	promptVol, volume	; output the answer with prompt
	

		ret

main ENDP
END