#include "stdio.h"

int main() {

  short x;  // short integer
  short y;

  x = 0x0F0F;   // swap values of x and y
  y = 0x00FF;

  printf( "Before swap: x is %04X, "
          "y is %04X\n", x, y );

  /*  faulty swapping code
  x = y;
  y = x  */


  /*  correct swapping code
  int temp;
  temp = x;
  x = y;
  y = temp;  */

  /*  correct swapping code */
  x = x ^ y;
  y = x ^ y;
  x = x ^ y;


  printf( "After  swap: x is %04X, "
          "y is %04X\n", x, y );

  return 0;
}
