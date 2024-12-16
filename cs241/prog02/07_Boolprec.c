#include "stdio.h"

int main() {
  
  printf( "AND has higher prec. than OR\n\n"
          " F and T  or T  is %d\n",
          0 && 1 || 1 );

  printf( "(F and T) or T  is %d\n",
          ( 0 && 1 ) || 1 );

  printf( " F and (T or T) is %d\n",
          0 && ( 1 || 1) );
  
  return 0;
}
