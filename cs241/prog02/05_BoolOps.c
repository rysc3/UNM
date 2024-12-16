#include "stdio.h"

int main() {
  
  printf ( "Boolean AND operator:\n\t"
    "T and T is %d, T and F is %d, F and F is %d\n", 
    54 && 14, 1 && 0, 0 && 0 );

  printf ( "Boolean OR operator:\n\t"
    "T or  T is %d, T or  F is %d, F  or F is %d\n",
    54 || 14,  1 || 0,  0 || 0 );  

  printf ( "Boolean NOT operator:\n\t"
    "not T is %d, not F is %d\n\n",
    ! 1, ! 0);
  
  return 0;
}
