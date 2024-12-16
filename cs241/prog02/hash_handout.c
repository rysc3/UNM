#include <stdio.h>
#include <string.h>

/*  PUT YOUR NAME HERE */

int main( int argc, char *argv[] ) {

  if ( argc != 2 ) {
    printf ( "You must enter a single argument on the command line\n" );
    return 1;  // Error code for operating system
  }

  char *theData = argv[1];

  // This line is for debugging purposes ONLY
  // This printf should not be part of your submitted program
  printf ( "You entered the word: %s\n", theData );

  unsigned int hashCode = 0;

  /* PUT YOUR CODE BETWEEN THIS COMMENT AND THE CLOSING COMMENT BELOW */
	int index;
	for(index = 0; index<strlen(theData); index++){
		unsigned int left4 = (hashCode >> 28)<<18;		//Set left 4
		hashCode += theData[index];
		if(index < strlen(theData) - 1){     //Check if you're on the last num
			hashCode = hashCode << 4;
			hashCode = left4 ^ hashCode;		 //if you're not on the last num, XOR to middle.
		}
		printf("index: %d\n", index);
		printf("Hash: %8x\n", hashCode);
		printf("Left: %8x\n", left4); 
	}


  /* CLOSING COMMENT   */

  printf ( "The hash of %s = %u\n", argv[1], hashCode );

  return 0;   // success code returned to Operating System
}
