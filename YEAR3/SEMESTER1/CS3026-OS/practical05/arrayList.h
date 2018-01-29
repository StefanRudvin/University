#ifndef ARRAYLIST_H
#define ARRAYLIST_H

typedef struct node {
   void * data ;
   struct node * next ;
} Node ;

typedef struct header {
   Node * first ;
   Node * last ;
} ArrayList ;

ArrayList * createList() ;

Node * add ( ArrayList *, void * ) ;

#endif
