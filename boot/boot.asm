;
; boot loader
; nasm boot.asm -o boot.bin
;
;
    org 07c00h          ; load program to 7c00
    mov ax, cs
    mov ds, ax
    mov es, ax
    call DispStr        ; call display string
    jmp $               ; loop forever
DispStr:
    mov ax, BootMessage
    mov bp, ax          ; es:bp = string address
    mov cx, 16          ; cx = string length
    mov ax, 01301h      ; ah =13, al = 01h
    mov bx, 000ch       ; bh = 0(page number), b1=0Ch(read font, black ground)
    mov dl, 0
    int 10h             ; interrupt 10
    ret
BootMessage:    db "Hello, OS world!"
times   510-($-$$) db 0 ; fill the next space, 
                        ; make the binary code be 512 bytes

dw      0xaa55      ; end
