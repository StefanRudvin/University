#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <unistd.h>
#include  <fcntl.h>

int main()
{
   pid_t pid ;

   //for the pipe
   int pipe_fd_array[2] ;
   char pipe_buffer[30] ;

   pipe(pipe_fd_array);

   printf ( "Start parent process : %d\n", getpid() ) ;

   pid = fork() ;

   if ( pid > 0 )
   {
      // parent
      printf ( "This is the parent : %d, starting child %d\n", getpid(), pid ) ;

      // the parent reads from the pipe (we use the file descriptor in
      // array element 0):
      printf ( "Parent, waiting for child ... \n") ;

      int status ;
      pid_t child;
      child = waitpid ( pid, &status, 0) ;

      printf ( "Child PID: %d \n", child) ;

      read   ( pipe_fd_array[0], pipe_buffer, 11);
      printf ( "Parent, received from child: %s\n", pipe_buffer ) ;

      // we can make the parent wait for the child to finish

   }
   else if ( pid == 0 )
   {
      printf ( "This is the child : %d\n", getpid() ) ;

      printf ( "   Child: writing to the pipe\n" );
      write  ( pipe_fd_array[1], "I am alive", 11 );  // don't forget to count
                                                      // the '\0' at the end
      printf ( "   Child: exiting\n" );

      printf ( "Child, from PARENT!!: %s\n", pipe_buffer ) ;

      exit(0);
   }
   else
   {
      printf ( "Some error occurred\n" );
   }
   return 0 ;
}
