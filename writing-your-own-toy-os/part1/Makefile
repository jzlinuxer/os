all: boot write

boot: boot.o
	ld86 -d boot.o -o boot

boot.o: boot.s
	as86 boot.s -o boot.o

write: write.c
	cc write.c -o write

clean:
	rm boot.o boot write
