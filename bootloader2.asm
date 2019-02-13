;; Second stage of bootloader

db 0xde, 0xad, 0xbe, 0xef ; DEADBEEF

extern kmain
;extern printString
;[org 0x7e00]
.boot:       
    call kmain
    jmp $

BOOT_STRING db "Second stage", 0xd, 0xa, 0x0

pad: ; Pad with zeroes and append signature
	times 512-($-$$) db 0
