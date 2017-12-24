// this is server.c
//
#include <stdio.h>
#include <stdlib.h>
#include <sys/msg.h>

int main()
{
   int   msqid =  0 ;
   key_t key   = 10 ;       // key should be a unique identifier, it can be
                            // derived by using the ftok() function, which
                            // generates a system-wide unique key from a file name plus
                            // some arbitrary number:
                            //     key_t key = ftok ( "/some/path/to/file", 99 ) ;
                            // in this example, we simply use some arbitrary integer value
                            // as key
                            // the same key has to be used on both server and client side
                            // to "get" the same message queue

   msqid = msgget ( key, IPC_CREAT | 0644 ) ;
   printf ( "Message queue create with id %d\n", msqid ) ;

   while ( TRUE )
   {
      // wait for incoming messages
      // see above receiver example
      // use msgrcv() in blocking fashion (don't specify IPC_NOWAIT)

      // ===============================================
      // here the server is (hopefully) doing something useful ...
      // ===============================================

      // send back message
      // see above sender example
      // use msgsnd()
   }

   // we use msgctl() to remove the queue
   if ( msgctl ( msqid, IPC_RMID, NULL ) < 0 )
   {
      printf ( "cannot remove message queue" ) ;
      exit ( -1) ;
   }
}
