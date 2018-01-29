// this is msg_receive.c
//
#include <stdio.h>
#include <stdlib.h>
#include <sys/msg.h>

#define MSGSIZE 256

int main ( int argc, char ** argv )
{
   int msqid = 0 ;

   // get message queue id from command line
   if ( argc > 1 ) msqid = atoi ( argv[1] ) ;
   else
   {
      fprintf ( stderr, "no msqid specified\n" ) ;
      exit ( -1 ) ;
   }

   // the system call msgrcv() requires us to declare a structure
   // with two elements
   //    long mtype        a long variable that can be used as a message type
   //    char mtext[n]     a character array for the message string of length n
   struct message
   {
      long mtype ;
      char mtext [ MSGSIZE ] ;
   } msg ;

   // the system call msgrcv() has the following signature:
   // ssize_t msgrcv ( int id, void *msg, size_t size, long mtype, int flags)
   //   msg is a pointer to the message structure, containing mtype and mtext
   //   size is only the size of mtext (mtype is not counted)
   //   if mtype == 0, then the first message in the queue is read
   //   if mtype > 0, then the first message of type mtype will be read, except
   //                 if flags == MSG_EXCEPT, then first message except those of type mtype are read
   //
   //   flags can be either 0 or IPC_NOWAIT or MSG_EXCEPT or MSG_NOERROR

   // the msgrcv() call removes a message from the message queue

   // we read all messages: mtype = 0

   int mtype = 0 ;

   ssize_t retval = msgrcv ( msqid, (void *) &msg, sizeof ( msg.mtext ), mtype, IPC_NOWAIT | MSG_NOERROR ) ;

   if ( retval > -1 ) printf ( "Received message [size: %d]: %s\n", retval, msg.mtext ) ;
   else
   {
      fprintf ( stderr, "something is wrong\n" ) ;
      exit ( -1 ) ;
   }

   return 0 ;
}
