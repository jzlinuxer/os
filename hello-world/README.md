# Hello World

## "Hello World" Theory

### Turning Machine

## Tools

### binutils

    apt-cache search binutils

* `ar`
    * create, modify, and extract static library from archives
* `strings`
    * list strings in object code
* `strip`
    * remove symbol table information from object file
* `nm`
    * list symbols from object files
* `size`
* `readelf`
    * display information about ELF files
* `objdump`
    * display information from object files

## Process

* Pre-Process(`cpp`) `-E`

* Compilation(`cc1`) `-S`

* Assembly(`as`) `-c`

* Linking(`ld`) `-O`

    gcc -E hello.c -o hello.i
    gcc -S hello.i -o hello.s
    gcc -c hello.s -o hello.o
    gcc -c hello.o -o hello

    gcc -g -c hello.c
    file hello



## Reference
* [Hacking Hello World by Jserv](http://blog.linux.org.tw/~jserv/archives/002125.html)
* [Hello C World](http://www.tinylab.org/project/hello-c-world/)
