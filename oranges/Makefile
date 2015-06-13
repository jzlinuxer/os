CC=gcc
LD=ld
LDFILE=x86.ld	# the loader file
OBJCOPY=objcopy

all: boot.img

# Step 1: call as to compile boot.s to boot.o
boot.o: boot.s
	$(CC) -c boot.s

# Step 2: ld call the x86.ld file link the boot.o to excutable file boot.elf
boot.elf: boot.o
	$(LD) boot.o -o boot.elf -e c -T$(LDFILE)

# Step 3: objcopy to remove unuseful section(.pdr, .comment, .note) in boot.elf
boot.bin: boot.elf
	@$(OBJCOPY) -R .pdr -R .comment -R .note -S -O binary boot.elf boot.bin

# Step 4: generate bootable image
boot.img: boot.bin
	@dd if=boot.bin of=boot.img bs=512 count=1	# use boot.bin to generate the first sector
	# fill the white space to make it to the correct size
	@dd if=/dev/zero of=boot.img skip=1 seek=1 bs=512 count=2879


clean:
	@rm -rf boot.o boot.elf boot.bin boot.img
