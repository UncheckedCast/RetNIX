;; Second stage of bootloader

LABEL db 0xde, 0xad, 0xbe, 0xef ; DEADBEEF

extern _kmain
;extern printString
;[org 0x7e00]
.boot:       
    call _kmain
    jmp $

BOOT_STRING db "Second stage", 0xd, 0xa, 0x0

;pad: ; Pad with zeroes and append signature
	;times 512-($-$$) db 0
