#include <stdio.h>
#include <stdlib.h>

void passbynormal(int number) {
  printf("pass by normal:  %d\n", number);
  number = 1;
}

void passbyampersand(int number) {
  printf("pass by &:  %d\n", number);
  number = 2;
}

void passbystar(int * number) {
  printf("pass by star:  %d\n", number);
  number = 3;
}

void changenum(int ** number) {
  *number = 999;
}

int main(int argc, char const *argv[]) {

  int x = 10, y = 10;

  printf("x normal variable:  %d\n", x);
  printf("y normal variable:  %d\n", y);

  printf("\n");

  passbynormal(x);
  passbynormal(y);
  printf("\n");

  passbyampersand(x);
  passbyampersand(y);

  printf("\n");

  passbystar(&x);
  passbystar(&y);

  printf("\n");

  changenum(&x);

  printf("x normal variable:  %d\n", x);
  printf("y normal variable:  %d\n", y);

  return 0;
}
