[BITS 16]
global printString

printString:
	lodsb

	or al, al
	jz printDone

	mov ah, 0x0e
	int 0x10

	jmp printString
	
	printDone:
		ret
