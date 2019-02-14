[BITS 16]
global printChar

printChar:
	mov ah, 0x0e
	int 0x10
		ret
