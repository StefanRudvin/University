#include <stdio.h>

#define BUFFER_SIZE 512

int main(int argc, char **argv )
{
	char buf [ BUFFER_SIZE + 1 ] ;
	int lines = 0 ;
	int words = 0 ;
	int chars = 0 ;
	int linelength = 0 ;

	// continue your implementation here
	// read from stdin, write to stdout

  printf("Name of file: %s\n", argv[1]);

  FILE *fp;
  char buff[255];

  fp = fopen(argv[1], "r");
  fscanf(fp, "%s", buff);
  printf("1 : %s\n", buff );

  fclose(fp);
}
