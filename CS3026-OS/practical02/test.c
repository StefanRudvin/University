# define LENGTH 10

char *testdata[] = {
  "This is the first string",
  "This is the second string",
  "This is the third string",
};

int main(int argc, char const *argv[]) {

  // declare pointer to a pointer to a char
  char ** myStringListPointer ;

  // Allocate array of pointers to character with LENGTH elements
  myStringListPointer = malloc ( sizeof(char *) * LENGTH);

  myStringListPointer[0] = malloc ( sizeof(char) * (strlen(testdata[0]) + 1));
  myStringListPointer[1] = malloc ( sizeof(char) * (strlen(testdata[1]) + 1));
  myStringListPointer[2] = malloc ( sizeof(char) * (strlen(testdata[2]) + 1));

  strcpy ( myStringListPointer[0], testdata[0]);
  strcpy ( myStringListPointer[1], testdata[1]);
  strcpy ( myStringListPointer[2], testdata[2]);




  return 0;
}
