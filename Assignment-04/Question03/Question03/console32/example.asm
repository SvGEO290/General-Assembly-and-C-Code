; Explain what this program does
; Author:  Your name
; Date:    put the date

.586
.MODEL FLAT

INCLUDE io.h

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
x			DWORD	?
y			DWORD	?
z			DWORD	?
prompt1		BYTE	"Value for x:"
prompt2		BYTE	"Value for y:"
prompt3		BYTE	"Value for z:"
promptVal	BYTE	"The result of the function f(x, y, z) = (x^4) + y^3 + z + (x + y)^4 * z is: ", 0
valueAns	DWORD	0

.CODE					; start of main code
main	PROC

		input	prompt1, x, 40
		atod	x

		input	prompt2, y, 40
		atod	y

		input	prompt3, z, 40
		atod	z
		
		mov eax, x
		mov edx, 4
		imul eax		; first step in recreating x^4
		imul eax		; second step in recreating x^4
		mov ebx, y
		mov edx, 3
		imul ebx, ebx
		add	eax, ebx	; eax = x^4 + ebx = y^3
		add	eax, z		; x^4 + y^3 + z
		mov ebx, x
		add	ebx, y		; ebx = the sum of both x and y
		mov edx, 4
		imul ebx
		mul	z


		mov valueAns, eax			; would end up with eax having the final value so we would put it into 'valueAns' for the output command

		output promptVal, valueAns	; would ouput the prompt and the answer following it. 

		ret

main ENDP
END