/* shell.c
 * 
 * Entry point to CS3026 FAT implementation assignment
 * 
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include "filesys.h"
#include "filesys.c"

int d() {
    printf ("Begin shell.c operation...\n");
    format();
    
    writedisk("virtualdiskD3_D1");
}

int c() {
    printf ("Begin shell.c operation...\n");

    format();

    MyFILE *openFile = myfopen("testfile.txt", "w");


    // ------------- W R I T E  T O  F I L E ------------ 

    //MyFILE * openFile = (MyFILE *) malloc(sizeof(MyFILE));

    char * charArray = (char *) malloc(4*BLOCKSIZE + 5);

    const char * alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXWZ";

    int alphabetCounter = 0;

    for (int i = 0; i < (4*BLOCKSIZE); i++) {
        //printf("%c", alphabet[alphabetCounter]);
        if (alphabetCounter > 25) {
            alphabetCounter = 0;
        }
        if (charArray != '\0') {
            charArray[i] = alphabet[alphabetCounter];
        }
        alphabetCounter++;
    }

    for (int i = 0; i < (4*BLOCKSIZE); i++) {
        myfputc(charArray[i], openFile);
    }
    
    myfputc('\0', openFile);

    openFile->pos = 0;

    // ------------- C L O S E  F I L E ----------

    myfclose(openFile);

    // ------------- R E A D  F I L E ------------ 

    MyFILE *openFile2 = myfopen("testfile.txt", "w");

    FILE *realTextFile = fopen("testfileC3_C1_copy.txt", "w");
    if (realTextFile == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }

    for (int i = 0; i < (BLOCKSIZE*4); i++) {
        int character = myfgetc(openFile2);
        if (character == -1) {
            break;
        }
        printf("%c", character);
        fprintf(realTextFile, "%c", character);
    }

    fclose(realTextFile);

    myfclose(openFile2);

    writedisk("virtualdiskC3_C1");

    return 0;
}

int b() {

    format();

    const char * newPath;

    newPath = "/myfirstdir/myseconddir/mythirddir";

    mymkdir(newPath);

    char ** result = malloc(12 * sizeof(char**));

    result = mylistdir("/myfirstdir/myseconddir");

    printf("Printing results from calling mylistdir(\"/myfirstdir/myseconddir\": --- \n");

    for (char* c = *result; c; c=*++result) {
        printf("%s\n", c);
    }

    writedisk("virtualdiskB3_B1_a");

    mychdir("/myfirstdir/myseconddir/");

    MyFILE *openFile = myfopen("testfile.txt", "w");

    result = mylistdir("/myfirstdir/myseconddir");

    printf("Printing results from calling mylistdir(\"/myfirstdir/myseconddir\": --- \n");

    for (char* c = *result; c; c=*++result) {
        printf("%s\n", c);
    }

    writedisk("virtualdiskB3_B1_b");
};

int a() {

    format();

    const char * newPath;

    char ** result = malloc(12 * sizeof(char**));

    mymkdir("/myfirstdir/myseconddir/");

    // A3_A1: Implement mychdir
    mychdir("/myfirstdir/myseconddir/");

    // A3_A1: Myfopen creates directory in relative folder
    MyFILE *openFile = myfopen("testfile.txt", "w");

    // A3_A1: Myfopen creates directory if it doesn't exist already
    MyFILE *openFile2 = myfopen("/myfirstdir/myseconddir/mythirddir/testfile2.txt", "w");

    result = mylistdir("/myfirstdir/myseconddir");

    printf("Printing results from calling mylistdir(\"/myfirstdir/myseconddir\": --- \n");

    for (char* c = *result; c; c=*++result) {
        printf("%s\n", c);
    }

    // A3_A1: implement myremove()
    myremove("/myfirstdir/myseconddir/testfile.txt");

    // A3_A1: cannot remove folder with files inside
    myrmdir("/myfirstdir/myseconddir/mythirddir");

    // A3_A1: remove file
    myremove("/myfirstdir/myseconddir/mythirddir/testfile2.txt");

    // A3_A1: folder removal allowed
    myrmdir("/myfirstdir/myseconddir/mythirddir");

    result = mylistdir("/myfirstdir/myseconddir");

    printf("Printing results from calling mylistdir(\"/myfirstdir/myseconddir\": --- \n");

    for (char* c = *result; c; c=*++result) {
        printf("%s\n", c);
    }

    myfclose(openFile);
    myfclose(openFile2);

    writedisk("virtualdiskA3_A1");
};

int main() {
    //d();
    //c();
    //b();
    a();
}