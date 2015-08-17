# [Writing Your Own Toy OS (PART II)](http://www.tldp.org/LDP/LG/issue79/krishnakumar.html)

How to use the BIOS interrupts?

BIOS does the copying of the boot sector to the RAM and execution of code there.
Besides this there are lot of thingsthat the BIOS does.
When an operating system boots up it does not have a vedio driver or a floppy driver or any other driver as such. To include any such driver in the boot sector is next ot impossible.
So some other way should be there. The BIOS comes to our help here.
BIOS contains various routines we can use. For example. there are ready made routines available for various purposes like, checking the equipments installed, controlling the printer, finding out memory size etc. Thes routines are what we call BIOS interrupts.

### How do we invoke BIOS interrupts?

We can use the assembly instruction `int` to invoke interrupts.

    int 0x10

### How do we pass the parameters?

Before calling the BIOS interrupt, we need to load certain values in prespecified format in the registers.
Suppose we are using BIOS interrupt 13h, which is for transferring the data from the floppy to the memory. Before calling interrupt 13h we have to specify the segment address to which the data would be copied. Also we need to pass as parameters the drive number, track number, sector number, number of sectors to be transferred etc. This we do by loading the prespecified registers with the needed values.

One important thing is that the same interrupt can be used for a variety of purposes. The purpose for which a particular interrupt is used depends upon the function number selected.
The choice of the function is made depending on the value present in the `ah` register.
For example interrupt `13h` can be used for displaying a string as well as for gerring the cursor position. If we move value 3 to the register `ah` then the function number 3 is selected which is the function used for getting the cursor position. For display the string we move `13h` to register `ah` which corresponds to displaying a string on screen.

## The boot sector


## The second sector


## The C program


## Compile

    as86 bsect.s -o bsect.o
    ld86 -d bsect.o -o bsect

    cc write.c -o write
    ./write
