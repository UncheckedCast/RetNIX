[BITS 16]
[ORG 0x7C00]

.global kmain

boot: ; Set up segments and stack
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    call mainLoop

mainLoop:
    mov si, msg
    call printString
    call kmain
    cli
    hlt
    ;jmp mainLoop

printString:
    lodsb

    or al, al
    jz printDone

    mov ah, 0x0e
    int 0x10

    jmp printString
	
    printDone:
        ret

msg db "Booting RetNIX...", 0x00

pad: ; Pad with zeroes and append signature
	times 510-($-$$) db 0
	dw 0xaa55 ; Magic number signature
