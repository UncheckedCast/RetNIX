;; Second stage of bootloader

extern kmain

.boot:
    call kmain
    jmp $
