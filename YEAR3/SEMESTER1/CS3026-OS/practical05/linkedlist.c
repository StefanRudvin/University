#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <unistd.h>

struct node {
   int someValue ;
   struct node * next :  // this is the important bit
} ;

typedef struct node Node ;

int main()
{
   Node * list = NULL ;     // this is the start of the list, its “head”
   Node * newEntry = NULL ; 

   Node * currentNode = list ;
   for ( int i = 0; i < 10; i ++ )
   {
      // we allocate memory of a size that can accommodate a node
      newEntry = malloc ( sizeof(Node) ) ;
      newEntry->next = NULL ;

      // we add the new entry to the end of the list
      // for this, we have to find the end of the list
      if ( currentNode == NULL )
         // list is empty
         list = newEntry ;
      else
      {
         while ( currentNode->next != NULL ) currentNode = currentNode->next ;
         // we moved currentNode to the last node in the list
         currentNode->next = newEntry ;
      }
   }
}
