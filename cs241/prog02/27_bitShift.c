#include "stdio.h"

int main() {
  
  unsigned int x = 0xC0000097;

  printf ( "bitwise Left Shift operator <<\n\t"
           "%08X << 3 is 0x%08X\n",  x,  x  << 3  );
  
  printf ( "bitwise Right Shift operator >>\n\t"
           "%08X >> 3 is 0x%08X\n",  x,  x  >> 3  );

  x = 100;
 
  printf ( "%d divided by 2 is: %d\n", x,  x >> 1 );
  printf ( "%d divided by 4 is: %d\n", x,  x >> 2 );



  signed int y = 0xC0000097;

  printf ( "bitwise Left Shift operator <<\n\t"
           "%08X << 3 is 0x%08X\n",  y,  y  << 3  );
  
  printf ( "bitwise Right Shift operator >>\n\t"
           "%08X >> 3is 0x%08X\n",  y,  y  >> 3  );

  y = -100;
 
  printf ( "%d divided by 2 is: %d\n", y,  y >> 1 );
  printf ( "%d divided by 4 is: %d\n", y,  y >> 2 );

  printf ( "-22/4 is: %d  and %08X\n",
            -22/4, -22/4 );

  printf ( "-22 >> 2  is: %d  and %08X\n",
           -22 >> 2, -22 >> 2 );


  // x is unsigned, y is signed int
  // literal hex values are UNSIGNED

  x = 0xF0000052;
  printf ( "x is: %08X, and literal 0xF0000052 is: %08X\n",
            x, 0xF0000052 );
  printf ( "x>>4 is: %08X, and literal 0xF0000052 >> 4 is: %08X\n",
            x >> 4, 0xF0000052 >> 4 );

  y = 0xF0000052;
  printf ( "y is: %08X, and literal 0xF0000052 is: %08X\n",
            y, 0xF0000052 );
  printf ( "y>>4 is: %08X, and literal 0xF0000052 >> 4 is: %08X\n",
            y >> 4, 0xF0000052 >> 4 );

  return 0;
}
