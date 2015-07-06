# Computer boot

## The System Boot Process

1. **Active the power**. Control chips send a reset singal to CPU(Real mode, CS=0xFFF, IP=0x0000), then the CPU excute the instruction from 0xffff0(Addr = CS<<4+IP), which is in the range of BIOS(Basic Input and Output System), and it will jump to the BIOS real start program.

2. **Power-On Self-Test(POST)**. The POST is a small computer program within the BIOS that cheks for hardware failures. A single beep after the POST signals that everything is okay.

3. **Initialize device**. The System BIOS will look for the Vedio Card BIOS(always in 0xC0000), then call its initialize code. It will display informations such as BIOS manufacturer and version. Then the System BIOS will look for other devices' BIOS, then initialize them.

4. **Test devices**. After looked up all other devices' BIOS, the System BIOS will display it's own start up process, including the system BIOS type, serial number and version. Then it will check and disply the CPU tye and spec, then it will check all RAM and show the test progress. After that, it will check some standard devices such as hard drives, floppy drives, ports.

5. **Update ESCD(Extended System Configuration Data)**. The ESC data usually stored in the battery-backed CMOS(Complementary Metal Oxide Semiconductor) RAM on the motherboard.

6. **Start Operating System**. The BIOS attempts to load the first sector of the boot disk to 0x7C00, and check the memory in 0x7DFE, if the content is 0xAA55, then jump to 0x7C00 to execute MBR(Master Boot Record). The MBR will find the first Active Partition from Partition Table, then read and execute the Patition Boot Sector. The Boot Sector read and execute the NTLDR(Windows NT Loader), then it turns control of the PC over to the Operating System.

## How to write an OS and load it to the memory?

### Boot Sector

BIOS will load the first sector(512B) to memory address `0x0000:0x7c00`, and check last two byte `55 AA`/`AA 55`.

1. Size 512B.
2. Last two bytes are "55 AA"(MBR signature).
3. Should be the first sector.

Byte Order: Big-Endian or Little-Endian?

### Why `0x7c00`? Memory Layout?

The first 1M byte of memory

`0x00000~0x003FF`: Real Mode IVT(Interrupt Vector Table)
`0x00400~0x004FF`: BDA(BIOS data area)
`0x00500~0x07BFF`: Conventional memory
`0x07C00~0x07DFF`: OS Boot Sector
`0x07E00~0x9FFFF`: Conventional memory
`0xA0000~0xBFFFF`: Vedio memory
`0xC0000~0xFFFFF`: System BIOS

### Registers
EIP:  instruction pointer which holds the memory address for the instruction being executed by the CPU.


### Real Mode and Protected Mode


### Interrupt

`int 10h`: vedio BIOS services

## Boot Assembly Code

### [Intel - boot.asm](boot.asm)

    nasm boot.asm -o boot.bin

### [ATT - boot.s](boot.s)

    as boot.s -o boot.o
    ld boot.o -o boot.elf -e c -Tx86.ld

*Note*: [Difference between Intel and AT&T Assembly](Intel-ATT.md)


## Reference
* [Research on Operating System Boot Process by YunoXie - Chinese](http://sunner.cn/courses/OS/pyos_boot.pdf)
* [How Computers Boot Up?](http://duartes.org/gustavo/blog/post/how-computers-boot-up/)
* [How PCs Work?](http://computer.howstuffworks.com/pc3.htm)
* [Computer Systems: A Programmer's Perspective - Chapter 3 Machine_Level Representation of Programs](http://csapp.cs.cmu.edu)
* [U-Boot -- The Universal Boot Loader](http://www.denx.de/wiki/U-Boot)
* [QEMU - Open Source Processor Emulator](http://wiki.qemu.org/Main_Page)
* [BusyBox: The Swiss Army Knife of Embedded Linux](http://www.busybox.net)
* [Buildroot: Making Embedded Linux Easy](http://buildroot.uclibc.org)
