CC=gcc
CFLAGS=-c -std=c99 -Wall
LFLAGS=

all: shell filesys

shell : shell.o
	$(CC) $(LFLAGS) -o shell shell.o

shell.o : shell.c
	$(CC) $(CFLAGS) hello.c

clean :
	rm -f *.o
