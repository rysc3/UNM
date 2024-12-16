#include "stdio.h"

int main() {

  _Bool areYoungerThan18 = 0;
  _Bool haveWeakHeart = 0;
  _Bool areConscientious = 0;

  if ( areYoungerThan18 || haveWeakHeart || areConscientious )
    printf( "You are excused from serving in miltary\n" );
  else
    printf( "You are required to serve in miltary\n" );
  
  areYoungerThan18 = 1;
  haveWeakHeart = 1;
  areConscientious = 0;

  if ( areYoungerThan18 || haveWeakHeart || areConscientious )
    printf( "You are excused from serving in miltary\n" );
  else
    printf( "You are required to serve in miltary\n" );

  areYoungerThan18 = areYoungerThan18 + haveWeakHeart;
  if ( areYoungerThan18 || haveWeakHeart || areConscientious )
    printf( "You are excused from serving in miltary\n" );
  else
    printf( "You are required to serve in miltary\n" );

  return 0;
}
