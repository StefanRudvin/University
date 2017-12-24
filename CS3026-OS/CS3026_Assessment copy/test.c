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

void changeTheMan(MyFILE * stream) {
    printf("Processing\n");
    stream->buffer.data[0] = 5;

    printf("From function: %d\n", stream->buffer.data[0]);
}

int main() {

    printf ( "Begin shell.c operation...\n");

    MyFILE *openFile;

    printf("First buffer of file: %d\n", openFile->buffer.data[0]);

    changeTheMan(openFile);

    printf("After change: %d\n", openFile->buffer.data[0]);



    return 0;
}