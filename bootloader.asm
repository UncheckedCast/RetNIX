[org 0x7C00]
[bits 16]

OFFSET: equ 0x0

__start: ; Set up segments and stack
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0xf000

    call mainLoop

mainLoop:
    mov si, msg
    call printString
    mov dh, 0
    mov dl, 0 ;; Boot drive
    jmp OFFSET
    ;cli
    ;hlt
    ;jmp mainLoop

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

diskRead:
    pusha
    push dx

    ;; Read disk
    mov ah, 0x02
    mov al, dh
    mov ch, 0x00
    mov cl, 0x02
    mov bx, OFFSET
    int 0x13

    ;; Print error if present
    jc diskReadErr

    ;;Check sector count
    pop dx
    cmp dh, al
    jne diskReadErr

    popa
    ret

diskReadErr:
    mov si, DISK_READ_ERRMSG
    call printString
    hlt

msg db "Booting RetNIX...", 0x0D, 0x0A, 0x00
DISK_READ_ERRMSG db "Disk read error.", 0x0D, 0x0A, 0x00


pad: ; Pad with zeroes and append signature
	times 510-($-$$) db 0
	dw 0xaa55 ; Magic number signature
