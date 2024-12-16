#include "stdio.h"

int main() {

  _Bool  x; 

  x = 0; 
  printf( "x is %d\n", x );

  x = 1; 
  printf( "x is %d\n", x );

  x = 42; 
  printf( "x is %d\n", x );

  // x = true;  ERROR

  return 0;
}
