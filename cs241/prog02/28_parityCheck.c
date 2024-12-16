#include "stdio.h"

int main() {

  // int x = 0x35; // 0011 0101

  int x = 0b00110101;

  int numOnes = 0;  // 0000 0000
  int mask = 1;     // 0000 0001

  int i;
  for ( i=0; i < 8; i++ ) {
    numOnes = numOnes + (x & 1);
    x = x >> 1;
  }

  printf ( "x has %d one bits\n\n", numOnes );

  int oddCount = numOnes % 2;   // result is 0 (even)
                                // or 1 (odd)
  if ( oddCount == 1 )
    printf ( "This value has Odd parity\n" );
  else
    printf ( "This value has Even parity\n" );

  return 0;
}
