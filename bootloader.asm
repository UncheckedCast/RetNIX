[BITS 16]
[ORG 0x7C00]

boot: ; Set up segments and stack
	mov ax, 0
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7c00


pad: ; Pad with zeroes and append signature
	times 510-($-$$) db 0
	dw 0xaa55 ; Magic number signature
