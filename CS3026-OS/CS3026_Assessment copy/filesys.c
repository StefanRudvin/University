/* filesys.c
 * 
 * provides interface to virtual disk
 * 
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include "filesys.h"


diskblock_t  virtualDisk [MAXBLOCKS] ;           // define our in-memory virtual, with MAXBLOCKS blocks
fatentry_t   FAT         [MAXBLOCKS] ;           // define a file allocation table with MAXBLOCKS 16-bit entries
fatentry_t   rootDirIndex            = 0 ;       // rootDir will be set by format
direntry_t * currentDir              = NULL ;
fatentry_t   currentDirIndex         = 3 ;

/* writedisk : writes virtual disk out to physical disk
 * 
 * in: file name of stored virtual disk
 */

void writedisk ( const char * filename )
{
   //printf ( "writedisk> virtualdisk[0] = %s\n", virtualDisk[0].data ) ;
   FILE * dest = fopen( filename, "w" ) ;
   if ( fwrite ( virtualDisk, sizeof(virtualDisk), 1, dest ) < 0 )
      fprintf ( stderr, "write virtual disk to disk failed\n" ) ;
   //write( dest, virtualDisk, sizeof(virtualDisk) ) ;
   fclose(dest) ;
   
}

void readdisk ( const char * filename )
{
   FILE * dest = fopen( filename, "r" ) ;
   if ( fread ( virtualDisk, sizeof(virtualDisk), 1, dest ) < 0 )
      fprintf ( stderr, "write virtual disk to disk failed\n" ) ;
   //write( dest, virtualDisk, sizeof(virtualDisk) ) ;
      fclose(dest) ;
}


/* the basic interface to the virtual disk
 * this moves memory around
 */

void writeblock ( diskblock_t * block, int block_address )
{
   //printf ( "writeblock> block %d = %s\n", block_address, block->data ) ;
   memmove ( virtualDisk[block_address].data, block->data, BLOCKSIZE ) ;
   //printf ( "writeblock> virtualdisk[%d] = %s / %d\n", block_address, virtualDisk[block_address].data, (int)virtualDisk[block_address].data ) ;
}

/* the basic interface to the virtual disk
 * this moves memory around
 */

diskblock_t readblock (int block_address)
{
    diskblock_t returnBlock;

    //printf ( "readblock> block %d", block_address) ;
    memmove (returnBlock.data, virtualDisk[block_address].data,  BLOCKSIZE ) ;

    //printf ( "readblock> virtualdisk[%d] = %s / %d\n", block_address, virtualDisk[block_address].data, (int)virtualDisk[block_address].data ) ;

    return returnBlock;
}


/* read and write FAT
 * 
 * please note: a FAT entry is a short, this is a 16-bit word, or 2 bytes
 *              our blocksize for the virtual disk is 1024, therefore
 *              we can store 512 FAT entries in one block
 * 
 *              how many disk blocks do we need to store the complete FAT:
 *              - our virtual disk has MAXBLOCKS blocks, which is currently 1024
 *                each block is 1024 bytes long
 *              - our FAT has MAXBLOCKS entries, which is currently 1024
 *                each FAT entry is a fatentry_t, which is currently 2 bytes
 *              - we need (MAXBLOCKS /(BLOCKSIZE / sizeof(fatentry_t))) blocks to store the
 *                FAT
 *              - each block can hold (BLOCKSIZE / sizeof(fatentry_t)) fat entries
 */

/* implement format()
 */
void format ( )
{
   diskblock_t block ;
   direntry_t  rootDir ;
   int         pos             = 0 ;
   int         fatentry        = 0 ;
   int         fatblocksneeded =  (MAXBLOCKS / FATENTRYCOUNT ) ;

   /* prepare block 0 : fill it with '\0',
    * use strcpy() to copy some text to it for test purposes
	* write block 0 to virtual disk
    */
    
    for ( int i = 0; i < BLOCKSIZE; i++){
        block.data[i] = '\0';
    };
    strcpy( block.data, "CS3026 Operating Systems Assessment" );
    writeblock( &block, 0 );

    /* prepare FAT table
	 * write FAT blocks to virtual disk
	 */

    for ( int i = 0; i < MAXBLOCKS; i++) {
        FAT[i] = UNUSED;
    };

    FAT[0] = ENDOFCHAIN ;
    FAT[1] = 2 ;
    FAT[2] = ENDOFCHAIN ;
    FAT[3] = ENDOFCHAIN ;

    copyFat();

	/* prepare root directory
	* write root directory block to virtual disk
    */

    for ( int i = 0; i < BLOCKSIZE; i++){
        block.data[i] = '\0';
    };

    block.dir.isdir     = 1;
    block.dir.nextEntry = 0;

    for (int i = 0; i < DIRENTRYCOUNT; i++){
        block.dir.entrylist[i].unused = TRUE;
    }

    rootDirIndex = 3;

    writeblock( &block, rootDirIndex);
}

void copyFat ()
{
    // Divide FAT into two blocks.
    // FAT = 1024
    fatblock_t fatBlocks[2];

    for (int i = 0; i < MAXBLOCKS; i++) {
        if (i < FATENTRYCOUNT) {
            fatBlocks[0][i] = FAT[i];
        } else {
            fatBlocks[1][i-FATENTRYCOUNT] = FAT[i];
        };
    }

    //for (int i = 0; i < sizeof(fatBlockIndex)/sizeof(fatBlockIndex[0]); i++) {
    for (int i = 0; i < 2; i++) {    
        //printf ( "Writing FAT block [%d] to block number %i\n", fatBlocks[i], i + 1) ;
        writeblock(fatBlocks[i] , i+1);
    }
}

/*
    Implement myfopen()
    Create a file called "testfile.txt" in your virtual disk.

    • Opens a file on the virtual disk and manages a buffer for
    it of size BLOCKSIZE, mode may be either “r” for readonly or “w”
    for read/write/append (default “w”)
 */
MyFILE * myfopen ( const char * filename, const char * mode ){

    // Count number of tokens
    // If above 1, make the call.
    // Then call mymkdir() with ones before last
    // call changedir() with ones before last.

    char * path = filename;

    char * copy = strdup(path);

    char *dir;
    char *rest = copy;
    int tokenCounter = 0;
 
    while ((dir = strtok_r(rest, "/", &rest))){
        tokenCounter ++;
    }

    if (tokenCounter > 1) {
        // Extract filename
        char *last = strrchr(path, '/');
        if (last != NULL) {
            filename = last+1;
        }
        int fileNameLen = strlen(filename);
        int pathLen = strlen(path);
        int cutOff = pathLen - fileNameLen;

        char otherString[pathLen]; // note 6, not 5, there's one there for the null terminator

        strncpy(otherString, path, cutOff);
        otherString[cutOff] = '\0'; // place the null terminator 

        printf("myfopen creating directories for: '%s , %s'\n",otherString, filename);

        mymkdir(otherString);
        mychdir(otherString);
    }

    MyFILE * openFile = (MyFILE *) malloc(sizeof(MyFILE));

    int found = FALSE;
    int pos;
    int i = 0;
    int freeBlock;

    diskblock_t block = virtualDisk[currentDirIndex];
    // diskblock_t block = readblock(rootDirIndex);

    for(int i = 0; i < DIRENTRYCOUNT; i++) {
        if (block.dir.entrylist[i].unused) continue;
        if (strcmp(block.dir.entrylist[i].name, filename) == 0) {
            found = TRUE;
            pos = i;
            break;
        }
    }

    if (found) {
        openFile->pos = 0; // Which byte you're reading within the block
        openFile->mode[0] = mode[0];
        openFile->blockno = block.dir.entrylist[pos].firstblock;
        openFile->buffer  = virtualDisk[block.dir.entrylist[pos].firstblock];
        openFile->dir_pos = pos;
    } else {
        for (int i = 0; i < DIRENTRYCOUNT; i ++) {
            if (block.dir.entrylist[i].unused == TRUE) {
                freeBlock = i;
                break;
            }
        }

        block.dir.entrylist[freeBlock].unused = FALSE;

        int nextFreeFatEntry = nextUnusedFatEntry();

        // printf ("Next Free FAT Entry: %d \n", nextFreeFatEntry);

        block.dir.entrylist[freeBlock].firstblock = nextFreeFatEntry;

        strcpy(block.dir.entrylist[freeBlock].name, filename);

        FAT[(int)nextFreeFatEntry] = ENDOFCHAIN;

        copyFat();

        writeblock(&block, currentDirIndex);

        diskblock_t openFileBlock = virtualDisk[nextFreeFatEntry];

        // Do stuff to file which is returned 
        openFile->pos     = (int)0; // Which byte you're reading within the block
        openFile->mode[0] = mode[0];
        openFile->buffer  = openFileBlock;
        openFile->blockno = nextFreeFatEntry;
        openFile->dir_pos = freeBlock;
    }

    return openFile;
}

void myfputc ( int b, MyFILE * stream ){

    stream->writing = TRUE;

    if (!stream) {
        fprintf(stderr, "Error in myfputc(), stream pointer is null");
        return;
    }

    // Depending on write policy either wait until block is full or write current block to memory.
    
    diskblock_t buffer = stream->buffer;

    // Check if pointer is too high for current block, then go to next FAT table
    if (stream->pos >= BLOCKSIZE) {
        // See if fat already points somewhere
        // printf ("Current Position! %d\n", stream->pos);
        // printf ("Current Blockno!  %d\n", stream->blockno);
        // printf ("Current block FAT:%d\n", FAT[stream->blockno]);

        writeblock(&buffer, stream->blockno);

        if (FAT[stream->blockno] == ENDOFCHAIN) {
            // FAT does not point anywhere, extend it.
            int nextFreeFatEntry = nextUnusedFatEntry();

            FAT[stream->blockno] = nextFreeFatEntry;
            FAT[nextFreeFatEntry] = ENDOFCHAIN;
            copyFat();

            stream->blockno = nextFreeFatEntry;
        } else {
            // // FAT does point to next node, look at that instead.
            // int lastFATChainIndex = getLastFatChainIndex(stream->blockno);
            // stream->blockno = lastFATChainIndex;
            // FAT[lastFATChainIndex] = ENDOFCHAIN;
            // copyFat();
        }
        
        stream->pos = stream->pos - BLOCKSIZE;

        for(int i = 0; i < BLOCKSIZE; i++) {
            stream->buffer.data[i] = '\0';
        }
    }

    virtualDisk[rootDirIndex].dir.entrylist[stream->dir_pos].filelength++;
    stream->buffer.data[stream->pos] = (unsigned char) b;
    stream->pos++;
    stream->writing = FALSE;
}

int myfgetc ( MyFILE * stream ) {
    // it has to be calculated whether all bytes of the files have been read by
    // checking the amount of chars read
    // against the file size stored in the directory entry. If the last byte of the
    //file has been read, then at the next call of fgetc(), the function has to return EOF
    direntry_t dir = virtualDisk[rootDirIndex].dir.entrylist[stream->dir_pos];

    int maxLength = dir.filelength;
    int currentLength = dir.entrylength;

    if (stream->pos >= BLOCKSIZE) {
        // No more blocks to get
        if (FAT[stream->blockno] == ENDOFCHAIN) {
            printf("\nEND of file reached due to FAT\n");
            return -1;
        }
        stream->blockno = FAT[stream->blockno];
        stream->pos = stream->pos - BLOCKSIZE;
    }

    char character = stream->buffer.data[stream->pos];

    if (maxLength < currentLength) {
        printf("\nEND of file reached due to file length %d\n", maxLength);
        return -1;
    }

    stream->pos++;
    virtualDisk[rootDirIndex].dir.entrylist[stream->dir_pos].entrylength++;

    return character;
}

// Cycle through all FAT nodes until you find the last one
fatentry_t getLastFatChainIndex(fatentry_t fatIndex){
    if (FAT[fatIndex] == ENDOFCHAIN) {
        return fatIndex;
    } else {
        return getLastFatChainIndex(FAT[fatIndex]);
    }
}

int nextUnusedFatEntry(){
    for ( int i = 0; i < MAXBLOCKS; i++) {
        if (FAT[i] == UNUSED) {
            return i;
        };
    };
    return -1;
}

void myfclose ( MyFILE * stream )
{
    direntry_t dir = virtualDisk[rootDirIndex].dir.entrylist[stream->dir_pos];
    printf("\nClosing, Final length of file: %i", dir.filelength);
    printf("\nAmount of chars read: %i\n", dir.entrylength);

    if (!stream) {
        fprintf(stderr, "Error in myfclose(), stream pointer is null");
        return;
    }
    // closes the file, writes out any blocks not written to disk
    writeblock(&stream->buffer, stream->blockno);

    free(stream);
}


/* use this for testing
 */

void printBlock ( int blockIndex )
{
   printf ( "virtualdisk[%d] = %s\n", blockIndex, virtualDisk[blockIndex].data ) ;
}


void mymkdir ( const char * path ) {
    // Get first. If it exists, make that one the current dir.

    // SEG FAULT : remember that pointers have to point to allocated memory and that string
    // literals are allocated in the segment ‘.rodata’ and cannot be manipulated.

    // direntry_t * currentDir              = NULL ;
    // fatentry_t   currentDirIndex         = 0 ;
    
    char * copy = strdup(path);

    char *dir;
    char *rest = copy;

    int freeBlock;
    int found        = FALSE;
    int counter      = 0;

    // The dir used in 'this' method. So that currentDirIndex is not changed.
    int thisDirIndex = currentDirIndex;

    // If absolute path
    if (path[0] == 47) {
        thisDirIndex = rootDirIndex;
    }
 
    while ((dir = strtok_r(rest, "/", &rest))){

        found = FALSE;

        // Find dir from current directory
        for(int i = 0; i < DIRENTRYCOUNT; i++) {
            if (!virtualDisk[thisDirIndex].dir.entrylist[i].isdir) continue;

            if (strcmp(virtualDisk[thisDirIndex].dir.entrylist[i].name, dir) == 0) {
                printf("Dir %s already exists, no need to create it.\n", dir);

                thisDirIndex = virtualDisk[thisDirIndex].dir.entrylist[i].firstblock;

                found = TRUE;
            }
        }

        if (!found) {

            // printf("Dir \"%s\" does not exist, creating...\n", dir);
            // Create new dir block
            // Find empty FAT and set Directory

            freeBlock = -1;

            for (int i = 0; i < DIRENTRYCOUNT; i ++) {
                if (virtualDisk[thisDirIndex].dir.entrylist[i].unused == TRUE) {
                    freeBlock = i;
                    break;
                }
            }

            if (freeBlock == -1) {
                fprintf ( stderr, "Not enough room in dir to make path %s\n", dir ) ;
                return;
            }
            
            virtualDisk[thisDirIndex].dir.entrylist[freeBlock].unused = FALSE;

            int nextFreeFatEntry = nextUnusedFatEntry();

            // printf ("Next Free FAT Entry: %d\n", nextFreeFatEntry);
            
            virtualDisk[thisDirIndex].dir.entrylist[freeBlock].firstblock = nextFreeFatEntry;

            virtualDisk[thisDirIndex].dir.entrylist[freeBlock].isdir       = TRUE;
            virtualDisk[thisDirIndex].dir.entrylist[freeBlock].entrylength = 0;
            virtualDisk[thisDirIndex].dir.entrylist[freeBlock].filelength  = 0;

            printf("Created Dir %s.\n", dir);

            strcpy(virtualDisk[thisDirIndex].dir.entrylist[freeBlock].name, dir);

            FAT[(int)nextFreeFatEntry] = ENDOFCHAIN;

            writeblock(&virtualDisk[thisDirIndex], thisDirIndex);

            copyFat();

            thisDirIndex = nextFreeFatEntry;

            // Make new dirblock!

            diskblock_t block;

            for ( int i = 0; i < BLOCKSIZE; i++){
                block.data[i] = '\0';
            };

            block.dir.isdir     = 1;

            for (int i = 0; i < DIRENTRYCOUNT; i++){
                block.dir.entrylist[i].unused = TRUE;
            }

            writeblock(&block, nextFreeFatEntry);
        }
    }
};


char ** mylistdir (const char * path){
    char * copy = strdup(path);

    char *dir;
    char *rest = copy;

    int freeBlock;

    int found = FALSE;

    char ** output = malloc(12*sizeof(char**));

    // The dir used in 'this' method. So that currentDirIndex is not changed.
    int thisDirIndex = currentDirIndex;

    if (path[0] == 47) {
        thisDirIndex = rootDirIndex;
    }

    // Output root directory if path is '/'
    if (path[1] == 0) {
        for (int i = 0; i < DIRENTRYCOUNT; i ++) {
            
            char * x = malloc(sizeof(char*)*200);

            strcpy(x, virtualDisk[thisDirIndex].dir.entrylist[i].name);

            output[i] = x;

            //printf("Entry %d in directory number %d is %s\n",i, rootDirIndex, virtualDisk[rootDirIndex].dir.entrylist[i].name);
        }
        return output;
    }

    //printf("First Entry Dir: %s\n", dirBlock.dir.entrylist[2].name);
 
    while ((dir = strtok_r(rest, "/", &rest))){

        // printf("Looking for: %s\n", dir);

        found = FALSE;

        // Find dir from current directory
        for(int i = 0; i < DIRENTRYCOUNT; i++) {
            if (!virtualDisk[thisDirIndex].dir.entrylist[i].isdir) continue;

            //printf("Entries in current Dir: %s\n", dirBlock.dir.entrylist[i].name);

            if (strcmp(virtualDisk[thisDirIndex].dir.entrylist[i].name, dir) == 0) {
                // printf("Dir %s found.\n", dir);

                thisDirIndex = virtualDisk[thisDirIndex].dir.entrylist[i].firstblock;

                found = TRUE;
            }
        }

        if (!found) {
            fprintf ( stderr, "You are trying to find path %s Which does not exist in the current directory.\n", dir ) ;
            return -1;
        }
    }
    for (int i = 0; i < DIRENTRYCOUNT; i ++) {

        char * x = malloc(sizeof(char*)*200);

        strcpy(x, virtualDisk[thisDirIndex].dir.entrylist[i].name);

        output[i] = x;
        
        //printf("Entry %d in directory number %d is %s\n",i, thisDirIndex, virtualDisk[thisDirIndex].dir.entrylist[i].name);
    }
    return output;
};

//this function will change into an existing directory, using path, e.g. mkdir (“/first/second/third”)
//creates directory “third” in parent dir “second”, which is a subdir of directory “first”, and “first
//is a sub directory of the root directory

void mychdir ( const char * path ) {
    char * copy = strdup(path);

    char *dir;
    char *rest = copy;

    int found = FALSE;

    // The dir used in 'this' method. So that currentDirIndex is not changed.
    int thisDirIndex = currentDirIndex;

    if (path[0] == 47) {
        thisDirIndex = rootDirIndex;
    }

    // Output root directory if path is '/'
    if (path[1] == 0) {
        return;
    }
 
    while ((dir = strtok_r(rest, "/", &rest))){

        found = FALSE;

        // Find dir from current directory
        for(int i = 0; i < DIRENTRYCOUNT; i++) {
            if (!virtualDisk[thisDirIndex].dir.entrylist[i].isdir) continue;

            if (strcmp(virtualDisk[thisDirIndex].dir.entrylist[i].name, dir) == 0) {
                //printf("Dir %s found.\n", dir);

                thisDirIndex = virtualDisk[thisDirIndex].dir.entrylist[i].firstblock;

                found = TRUE;
            }
        }

        if (!found) {
            fprintf ( stderr, "You are trying to find path %s Which does not exist in the current directory.\n", dir ) ;
            return;
        }
        currentDirIndex = thisDirIndex;
    }

    printf("Moved to dir Index: %d\n", currentDirIndex);
}

void myremove ( const char * path ) {

    char * copy = strdup(path);

    char *dir;
    char *rest = copy;

    int found = FALSE;

    // The dir used in 'this' method. So that currentDirIndex is not changed.
    int thisDirIndex = currentDirIndex;

    if (path[0] == 47) {
        thisDirIndex = rootDirIndex;
    }

    // Output root directory if path is '/'
    if (path[1] == 0) {
        return;
    }
 
    while ((dir = strtok_r(rest, "/", &rest))){

        found = FALSE;

        for(int i = 0; i < DIRENTRYCOUNT; i++) {

            if (!virtualDisk[thisDirIndex].dir.entrylist[i].isdir) {

                if (strcmp(virtualDisk[thisDirIndex].dir.entrylist[i].name, dir) == 0) {
                    
                    printf("Deleting file: %s\n", dir);

                    int deleteIndex = virtualDisk[thisDirIndex].dir.entrylist[i].firstblock;
                    
                    // Free FAT
                    FAT[deleteIndex] = UNUSED;
                    copyFat();

                    // Free parent dirblock
                    diskblock_t block1;
                    for ( int i = 0; i < BLOCKSIZE; i++){
                        block1.data[i] = '\0';
                    };
                    direntry_t emptyDirEntry = block1.dir.entrylist[0];

                    virtualDisk[thisDirIndex].dir.entrylist[i] = emptyDirEntry;
                    virtualDisk[thisDirIndex].dir.entrylist[i].unused = TRUE;

                    writeblock(&virtualDisk[thisDirIndex], thisDirIndex);
                    
                    // Overwrite memory
                    diskblock_t block;
                    for ( int i = 0; i < BLOCKSIZE; i++){
                        block.data[i] = '\0';
                    };

                    writeblock(&block,deleteIndex);

                    return;
                }
                continue;
            }

            if (strcmp(virtualDisk[thisDirIndex].dir.entrylist[i].name, dir) == 0) {
                thisDirIndex = virtualDisk[thisDirIndex].dir.entrylist[i].firstblock;
                found = TRUE;
            }
        }

        if (!found) {
            fprintf ( stderr, "You are trying to find path %s Which does not exist in the current directory.\n", dir ) ;
            return;
        }
    }
}

// this function removes an existing directory, using path,
//e.g. myrmdir (“/first/second/third”) removes directory “third” in
//parent dir “second”, which is a subdir of directory “first”, and “first
//is a sub directory of the root directory
void myrmdir ( const char * path ) {

    char * copy = strdup(path);

    char *dir;
    char *rest = copy;

    int found = FALSE;

    // The dir used in 'this' method. So that currentDirIndex is not changed.
    int thisDirIndex = currentDirIndex;

    if (path[0] == 47) {
        thisDirIndex = rootDirIndex;
    }

    // Output root directory if path is '/'
    if (path[1] == 0) {
        return;
    }

    int pos;
    int previousDir;
 
    while ((dir = strtok_r(rest, "/", &rest))){

        found = FALSE;

        for(int i = 0; i < DIRENTRYCOUNT; i++) {

            if (!virtualDisk[thisDirIndex].dir.entrylist[i].isdir) continue;

            if (strcmp(virtualDisk[thisDirIndex].dir.entrylist[i].name, dir) == 0) {

                pos = i;
                previousDir = thisDirIndex;

                thisDirIndex = virtualDisk[thisDirIndex].dir.entrylist[i].firstblock;
                found = TRUE;
            }
        }

        if (!found) {
            fprintf ( stderr, "You are trying to find path %s Which does not exist in the current directory.\n", dir ) ;
            return;
        }
    }

    for(int i = 0; i < DIRENTRYCOUNT; i++) {
        if (!virtualDisk[thisDirIndex].dir.entrylist[i].unused) {
            fprintf ( stderr, "Cannot remove a directory which has files in it.\n", dir ) ;
            return;
        }
    }


    // Free FAT
    FAT[thisDirIndex] = UNUSED;
    copyFat();

    // Free parent dirblock
    diskblock_t block1;
    for ( int i = 0; i < BLOCKSIZE; i++){
        block1.data[i] = '\0';
    };

    direntry_t emptyDirEntry = block1.dir.entrylist[0];

    virtualDisk[previousDir].dir.entrylist[pos] = emptyDirEntry;
    virtualDisk[previousDir].dir.entrylist[pos].unused = TRUE;

    writeblock(&virtualDisk[thisDirIndex], thisDirIndex);
    
    // Overwrite memory
    diskblock_t block;
    for ( int i = 0; i < BLOCKSIZE; i++){
        block.data[i] = '\0';
    };

    writeblock(&block,thisDirIndex);

    return;
}

