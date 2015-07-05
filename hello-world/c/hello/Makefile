# simplest version
# all: hello.c
# 	gcc -g -Wall -o hello hello.c
# clean:
# 	$(RM) hello

# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g		adds debugging information to the executable file
#  -Wall	turns on most, but not all, compiler warnings
CFLAGS = -g -Wall

# object diectory
ODIR = obj

# the build target executable:
MAIN = hello

all: $(MAIN)

$(MAIN): $(MAIN).o 
	$(CC) $(CFLAGS) $(ODIR)/$(MAIN).o -o $(ODIR)/$(MAIN)

$(MAIN).o: $(MAIN).s
	$(CC) $(CFLAGS) -c $(ODIR)/$(MAIN).s -o $(ODIR)/$(MAIN).o

$(MAIN).s: $(MAIN).i
	$(CC) $(CFLAGS) -S $(ODIR)/$(MAIN).i -o $(ODIR)/$(MAIN).s 

$(MAIN).i: $(MAIN).c
	$(CC) $(CFLAGS) -E $(MAIN).c -o $(ODIR)/$(MAIN).i

clean:
	$(RM) $(TARGET) $(ODIR)/*
