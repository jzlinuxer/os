/**
 * Hello world example.
 *
 * compile in one step:
 *  gcc hello.c -o hello
 *
 * compile in mutiple steps:
 *  preprocessing(-S: generate "*.i" file)
 *   gcc -E hello.c -o hello.i
 *  compilation(-S: generate "*.s" assembly code)
 *   gcc -S hello.i -o hello.s
 *  assembly(-c: only compile, generate "*.o" file, not linking)
 *   gcc -c hello.s -o hello.o
 *  linking
 *   gcc hello.o -o hello
 *
 *  gdb debug
 *   gcc -g hello.c -o hello
 */
#include <stdio.h>

int main(int argc, char *argv[]) {
    printf("Hello World!\n");
    return 0;
}
