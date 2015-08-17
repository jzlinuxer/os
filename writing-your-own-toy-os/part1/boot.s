; display a character on the screen

entry start
start:
    mov ax, #0xb800 ; 0xb800 is the address of the video memory
    mov es, ax      ; es stands for extra segment register
    ; we have made the video memory our extra segment, so anything written to extra segment would go to video memory
    ; to display any character on the screen, we need to write two bytes to the video memory
    seg es
    mov [0], #0x41  ; the ascii value(0x41: A) we are going to display
    seg es
    mov [1], #0x1f  ; the character attribute, ox1f means white character on a blue backgroud
loop1: jmp loop1     ; loop forever
