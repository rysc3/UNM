#include "stdio.h"

int main() {

  int x = 0;

  printf ( "x is: %d\n", x );

  x = 15; 

  printf ( "x is: %d\n", x );

  x == 42;  // typo, no assignment

  printf ( "x is: %d\n", x );

  (3+5)*8;     // legal, but useless code

  x = (3+5)*8; // save the result of the math

  printf ( "x is: %d\n", x );

  return 0;
}
