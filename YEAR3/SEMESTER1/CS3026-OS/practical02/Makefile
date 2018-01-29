CC=gcc
CFLAGS=-c -std=c99 -Wall
LFLAGS=

all: hello mydatabase practical3

# helloworld : hello.o
# 	$(CC) $(LFLAGS) -o helloworld hello.o

hello.o : hello.c
	$(CC) $(CFLAGS) hello.c
#
# practical3helloworld : practical3.o
# 	$(CC) $(CFLAGS) -o practical3helloworld practical3.o

practical3.o : practical3.c
	$(CC) $(LFLAGS) practical3.c


# test.o : test.c
# 	$(CC) $(CFLAGS) test.c
#
# testworld : test.o
# 	$(CC) $(CFLAGS) -o testworld test.o

# mydatabase : mydatabase.o employee.o
# 	$(CC) $(LFLAGS) -o mydatabase mydatabase.o employee.o
#
# mydatabase.o : mydatabase.c employee.h
# 	$(CC) $(CFLAGS) mydatabase.c
#
# employee.o : employee.c employee.h
# 	$(CC) $(CFLAGS) employee.c

clean :
	rm -f helloworld
	rm -f hello
	rm -f employee
	rm -f test
	rm -f practical3
	rm -f mydatabase
	rm -f *.o
