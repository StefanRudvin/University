#define LENGTH  10

char *testdata[] = { "This is the first string",
                     "This is the second one",
                     "Finally, this is the third" } ;

int main()
{
   // declare a pointer to a pointer to char
   char ** myStringListPointer ;

   // this allocates an array of pointers to character with LENGTH elements
   // note that 'char *' is a pointer type: we want to allocate memory
   // for pointers, as myStringListPointer is a list of pointers:

   myStringListPointer = malloc ( sizeof(char *) * LENGTH ) ;

   // you may realize that you have to use 'sizeof(char *)' in
   // the malloc() above, as we
   // don't know how many bits a pointer needs on your computer:
   // if it is a 32-bit operating system, then a pointer needs
   // 4 bytes, on a 64-bit OS it will need 8 bytes

   // we also allocate memory for each String, however we first measure
   // the string we want to store
   // we have to account for the '\0' at the end of a string
   // we calculate: we need strlen(testdata[0]) + 1, which is the string
   // "This is the first string" plus one extra byte for '\0', and this
   // times sizeof(char). For purpose of being precise and getting used to
   // to it, we write here
   // sizeof(char), although char is only 1 byte. However, in case
   // you would use another type, you have to use sizeof()

   char *myPointerList[64];

   myPointerList[0] = malloc ( sizeof(char) * (strlen(testdata[0])+1) ) ;
   myPointerList[1] = malloc ( sizeof(char) * (strlen(testdata[1])+1) ) ;
   myPointerList[2] = malloc ( sizeof(char) * (strlen(testdata[2])+1) ) ;
   // etc.

   // now, we copy something into these allocated memory areas:

   strcpy ( myStringListPointer[0], testdata[0] ) ;
   strcpy ( myStringListPointer[1], testdata[1] ) ;
   strcpy ( myStringListPointer[2], testdata[2] ) ;
}
