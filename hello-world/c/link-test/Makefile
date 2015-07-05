# simplest version:
# hello-test: hello-test.c hello.c
#	gcc -o hello-test hello-test.c hello.c -I.

# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g		adds debugging information to the executable file
#  -Wall	turns on most, but not all, compiler warnings
CFLAGS = -g -Wall

# include files(.h) directory, for example, `../include`
IDIR = .
INCLUDES = -I$(IDIR)

# object files(.o) directory
ODIR = obj

# librarie path
LDIR = ../lib
LFLAGS = -L$(LDIR)

# define any libraies to link into executable:
LIBS = -lm

# include files(.h) on which .c files depends
_DEPS = hello.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

# object files(.o)
_OBJ = hello-test.o hello.o
OBJ = $(patsubst %, $(ODIR)/%, $(_OBJ))

# define the executable file
MAIN = hello-test

# generate the .o file by compiling the .c file using $(CC)
#  -o $@	put the output of the compilation in the file named on the left side of the `:`
#  $<		the first item in the dependencies list
$(ODIR)/%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@ 

# 
# hello-test: -test.o hello.o
#	$(CC) -o hello-test.o hello.o -I.
# $@: special macros, left sides of the `:`, here is $(MAIN)
# $^: special macros, right sides of the `:`, here is $(OBJ)
$(MAIN): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^ $(LFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ $(MAIN) 
