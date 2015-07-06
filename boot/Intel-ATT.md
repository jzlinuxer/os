# Intel and AT&T Syntax
Intel and AT&T syntax Assembly language are very different from each other in appearance.

## Prefixes
Intel: no register prefixes or immed prefixes. 
AT&T: registers are prefixed with a `%` and immed's are prefixed with a `$`.

    move    eax, 1      ; Intel
    movl    $1, %eax    # AT&T

Intel: hexadecimal or binary immed data are suffixed with `h` and `b` respectively. Also if the first hexadecimal digit is a letter then the value is prefixed by a `0`.
AT&T: hexadecimal with prefix `0x`

    int     80h         ; Intel with suffix 'h'
    int     $0x80       # AT&T with prefix '0x'
    mov     ebx, 0ffh   ; Intel with prefix '0' when first hex is letter
    movl    $0xff, %ebx # AT&T with prefx '0x'

## Direction of Operands
Intel: first operand is destination, and second operand is source.
AT&T: first operand is source and second operand is destination(natural).

    instr   dest, source    ; Intel
    instr   source, dest    # AT&T

## Memory Operands
Intel: base register is enclosed in `[` and `]`.
AT&T: base register is enclosed in `(` and `)`.

    mov     eax, [ebx]      ; Intel
    mov     (%ebx), eax     # AT&T

Intel: `segreg[base+index*scale+disp]`(make sence)
AT&T: `%segreg:disp(base,index,scale)`(complex)

    instr   foo,segreg:[base+index*scale+disp]  ; Intel
    instr   %segreg:disp(base,index,scale),foo  # AT&T
    mov     eax, [ebx+3]                        ; Intel
    mov     3(%ebx), eax                        # AT&T
    sub     eax, [ebx+ecx*4h-20h]               ; Intel
    sub     -0x20(%ebx,%ecx,0x4), %eax          # AT&T

## Parameter size
Intel:  byte ptr, word ptr, dword ptr. `dword` of corresponding to `long`.
AT&T: has suffix for operand size, `l` is for long, `w` is for word, and `b` is for byte.

    mov     ax, bx                  ; Intel
    movl    %bx, %ax                # AT&T
    mov     eax, dword ptr [ebx]    ; Intel
    movl    (%ebx), %eax            # AT&T

## Reference
* [x86 assembly language - Wikipedia](https://en.wikipedia.org/wiki/X86_assembly_language)
* [Intel and AT&T Syntax](http://www.imada.sdu.dk/Courses/DM18/Litteratur/IntelnATT.htm)

