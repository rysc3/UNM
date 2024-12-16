#include "stdio.h"

int main() {

  if ( 3 < 5 )
    printf ("the condition is true\n" );
  else
    printf( "the condition is false\n" );

  if ( 0 )
    printf ("the condition is true\n" );
  else
    printf( "the condition is false\n" );

  if ( 67 )
    printf ("the condition is true\n" );
  else
    printf( "the condition is false\n" );

  int x = 42;

  if ( -15 < x < 5 )
  //if ( -15 < x && x < 5 )
    printf ( "x is in the range\n" );
  else
    printf ( "x is NOT in the range\n" );

  return 0;
}
