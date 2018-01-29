#include <stdio.h>

int x = 0 ;   // this variable is now global to
              // all functions in this file

void testx()
{
   printf ( "x = %d\n", x ) ;
}
