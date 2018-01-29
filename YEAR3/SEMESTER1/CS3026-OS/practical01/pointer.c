#include <stdio.h>

void swap(int *, int *);

int main(int argc, char ** argv)
{

  short iamshort;

  int iamint;

  long iamlong;

  float iamfloat;

  double iamdouble;

  long double iamlongdouble;

  printf("Size of short %lu\n", sizeof(iamshort));
  printf("Size of int %lu\n", sizeof(iamint));
  printf("Size of long %lu\n", sizeof(iamlong));
  printf("Size of float %lu\n", sizeof(iamfloat));
  printf("Size of double %lu\n", sizeof(iamdouble));
  printf("Size of long double %lu\n", sizeof(iamlongdouble));

  int x = 10;
  int y = 2;

  printf("Before: x = %i, y = %i\n", x, y);

  swap(&x, &y);

  printf("After: x = %i, y = %i\n", x, y);

}

void swap ( int *a, int *b )
{
   int temp ;
   temp = *a ;
   *a = *b ;
   *b = temp ;
}
