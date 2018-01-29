// this is threadadd.c
//
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX_ITERATION 10000

int shared_count = 0 ;    // this is a global variable within this process
                          // all threads will share it

/*
 * this is a function called by both POSIX threads
 */

 void * threadAdd ( void * arg)
 {
    int i = 0 ;
	int local_count = 0 ;

    // we will increment the shared counter
	// we also do some copying so that both threads may be interrupted and
	// rescheduled during this update
	for ( i = 0; i < MAX_ITERATION; i ++ )
	{
	   local_count = shared_count ;	      // first, copy the value of shared_count into this local variable
	   local_count ++ ;                   // increment the local copy
	   shared_count = local_count ;       // copy the incremented value back to shared_count
	}
	pthread_exit(0); //exit thread
 }

 int main ( )
 {
    pthread_t tid1 ;
	pthread_t tid2 ;

    // create thread 1
	if ( pthread_create ( &tid1, NULL, threadAdd, NULL ) )
	{
	   perror ( "Error creating thread 1\n" ) ;
	   exit(1) ;
	}

    // create thread 2
	if ( pthread_create ( &tid2, NULL, threadAdd, NULL) )
    {
	   perror ( "Error creating thread 2\n" ) ;
	   exit(1) ;
	}

	// the process waits for thread 1 to finish
	if ( pthread_join ( tid1, NULL ) )
	{
	   perror ( "Error joining thread 1\n" ) ;
	   exit(1) ;
	}
	// the process waits for thread 2 to finish
	if ( pthread_join ( tid2, NULL ) )
	{
	   perror ( "Error joining thread 2\n" ) ;
	   exit(1) ;
	}

	// checking the final result of our shared counter
	// as two threads performed increments on it, its final value should be
	// exactly 2 times MAX_ITERATION !
	if ( shared_count == 2 * MAX_ITERATION )
	   printf ( "Thankfully, no race condition: shared_count = %d\n", shared_count ) ;
	else
	{
	   printf ( "Race Condition !!!" ) ;
	   printf ( "Bad news: shared_count == %d, but should actually be %d\n", shared_count, 2*MAX_ITERATION ) ;
	}

 }
