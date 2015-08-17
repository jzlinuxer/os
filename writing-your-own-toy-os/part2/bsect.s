; load the sector 2, of track number 0, driver number 0 to segment 0x500.
; call interrupt 13h and jump to 0th offset in segment 0x500
; 

LOC1=0x500 ; the address location to which the code in the second sector of the floppy(the first sector is the boot sector) is moved to

entry start
start:
    mov ax, #LOC1   ; load the value 0x500 into the es register
    mov es, ax
    mov bx, #1      ; specify the offset within the segment as zero

    mov dl, #0  ; load drive number into dl register
    mov dh, #0  ; load head number into dh register
    mov ch, #0  ; load track number into ch register
    mov cl, #2  ; load sector number into cl register
    mov al, #1  ; load the number of sectors to be transferred to register al

    mov ah, #2  ; move value 2 into register ah is corresponds to choosing a function number
                ; this is choose from the functions provided by interrupt 13h
                ; choose function number 2 which is the function used for transferring data from floppy


    int 0x13    ; call interrupt 13h and finally jump to 0th offset in the segment 0x500

    jmpi 0, #LOC1
