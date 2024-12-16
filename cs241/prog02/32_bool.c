#include "stdio.h"
#include "stdbool.h"

int main() {

  // includes the macro definitions
  // #define true  1
  // #define false 0
  // #define bool  int (not quite correct)
  
  bool x;

  x = false;  printf ( "x is %d\n", x );  
  x = true;   printf ( "x is %d\n", x );  

  printf ( "x + 12 is %d\n\n", x + 12 );   

  return 0;
}

