// test string tokenizer
#include <string.h>
#include <stdio.h>

int main ( int argc, char ** argv )
{
   char * s = argv[1] ;

   char * remainingPath = NULL ;
   char * token = strtok_r( s, "/", &remainingPath ) ;
   
   while ( token )
   {
      printf ( "token : %s, remainingPath : %s\n", token, remainingPath ) ;
      // strtok maintains an internal variable for the parsed string,
      // NULL indicates that it should return the next token
      token = strtok_r ( NULL, "/", &remainingPath ) ;

   }
}
