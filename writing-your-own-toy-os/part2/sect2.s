entry start
start:
    mov ah, #03 ; set 3 for intrupt to get the current cursor position
    xor bh, bh  ; clear the value in bh register
    int 0x10    ; call interrupt

    mov cx, #26     ; mymsg length: 2 + 24
    mov bx, #0x0007 ; display attribute: white characters on black background
    mov bp, #mymsg  ; 
    mov ax, #0x1301
    int 0x10

loop1: jmp loop1

mymsg:
    .byte 13, 10    ; correspind to an enter which is the Carriage Return and the Line Feed
    .ascii "Handling BIOS interrupts"   ; a 24 character string
