#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

// we declare a global semaphore mutex

sem_t mutex ;


int shared_count = 0 ;    // this is a global variable within this process
                          // all threads will share it

/*
 * this is a function called by POSIX thread 1
 */

 void * increment(void * arg)
 {
    int tmp = 0 ;

	// what do you have to do to saveguard this critical section ?
	// look up the POSIX API for wait / signal functions

    sleep(1) ;
  	tmp = shared_count ;
  	tmp ++ ;
  	shared_count = tmp ;
 }

 void * decrement(void * arg)
 {
    int tmp = 0 ;

	// what do you have to do to saveguard this critical section ?
	// look up the POSIX API for wait / signal functions

    sleep(1) ;
  	tmp = shared_count ;
  	tmp -- ;
  	shared_count = tmp ;
 }

 int main ( )
 {
    pthread_t tid1 ;
  	pthread_t tid2 ;

  	// we initialise mutex to act as a mutex
  	sem_init(&mutex, 0, 1);

      // ... create two threads that execute the two functions above

      // print out shared_count

}
