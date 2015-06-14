.code16                     # 16 bit mode
.text                       # code section
    mov     %cs, %ax
    mov     %ax, %ds
    mov     %ax, %es
    call    DispStr
    jmp     .               # loop forever
DispStr:
    mov     $BootMessage, %ax
    mov     %ax, %bp        # ES:BP = String address
    mov     $16, %cx        # CX = String length
    mov     $0x1301, %ax    # AH = 13, AL = 01h
    mov     $0x00c, %bx     # BH=0(page number = 0), BL=0Ch
    mov     $0, %dl
    int     $0x10           # interrupt 10
    ret
BootMessage: .ascii "Hello, OS World!"
.org 510                    # fill to ~510~ byte
.word 0xaa55                # end tag
