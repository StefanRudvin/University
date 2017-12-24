// this is msg_send.c
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

   // the system call msgsnd() requires us to declare a structure
   // with two elements
   //    long mtype        a long variable that can be used as a message type
   //    char mtext[n]     a character array for the message string of length n
   struct message
   {
      long mtype ;
      char mtext [ MSGSIZE ] ;
   } msg ;

   // we specify some arbitrary message type, msgrcv() can select messages from the
   // message queue according to this value

   msg.mtype = 99 ;

   // we put some message into mtext

   sprintf ( msg.mtext, "%s", "This is Message 99" ) ;

   // the system call msgsnd() has the following signature:
   // int msgsnd ( int id, const void *msg, size_t size, int flags)
   //   msg is a pointer to the message structure, containing mtype and mtext
   //   size is only the size of mtext (mtype is not counted)
   //   flags can be either 0 or IPC_NOWAIT

   // the msgsnd() call adds a message to the message queue

   int retval = msgsnd ( msqid, (void *) &msg, sizeof ( msg.mtext ), IPC_NOWAIT ) ;

   return 0 ;
}
