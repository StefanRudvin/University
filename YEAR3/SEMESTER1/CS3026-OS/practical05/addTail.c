#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

struct node {
   int someValue ;
   struct node * next ;  // this is the important bit
};

typedef struct node Node ;

struct node * addTail(struct node ** head, int data) {

  struct node * newNode;

  newNode = malloc ( sizeof(Node) ) ;
  newNode->someValue = data;
  newNode->next = NULL ;

  Node * currentNode = *head;

  while (currentNode != NULL) {
    currentNode = currentNode->next;
  }
  currentNode->next = newNode;

  return *head;
};

int main()
{
   Node * list = NULL ;     // this is the start of the list, its “head”
   Node * newEntry = NULL ;

   Node * head = malloc(sizeof(Node));

   head->someValue = 200;
   head->next = NULL;

   list = head;

   addTail(&list, 55);

   Node * printer;

   printer = list;

   while(printer != NULL) {
     printf("Number : %i\n", printer->someValue);
     printer = printer->next;
   }
};
