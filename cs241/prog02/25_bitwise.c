#include "stdio.h"

int main() {
  
  printf ( "bitwise AND operator &\n\t"
           "1001 0111 & 1100 0010 is %X\n",
            0x97 & 0xC2 );

  printf ( "logical AND operator &&\n\t"
           "1001 0111 && 1100 0010 is %X\n",
            0x97 && 0xC2 );

  printf ( "bitwise OR  operator |\n\t"
           "1001 0111 | 1100 0010 is %X\n",
            0x97 | 0xC2 );

  printf ( "logical OR  operator ||\n\t"
           "1001 0111 || 1100 0010 is %X\n",
            0x97 || 0xC2 );
  
  printf ( "bitwise XOR operator ^\n\t"
           "1001 0111 ^ 1100 0010 is %X\n",
            0x97 ^ 0xC2 );

  printf ( "bitwise Not operator ~\n\t"
           " ~ 1100 0010 is %X\n",
             ~ 0xC2 );

  printf ( "logical Not operator !\n\t"
           " ! 1100 0010 is %08X\n",
             ! 0xC2 );

  printf ( "logical Not operator !\n\t"
           " ! 0000 0000 is %08X\n",
             ! 0x00 );


  return 0;
}
