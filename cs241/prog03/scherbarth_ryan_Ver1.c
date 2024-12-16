#include <stdio.h>
#include <stdbool.h>

// Ryan Scherbarth 
// CS241 Porjecet 3, Steganoraphy 
int main(){
	// Return 1 if message is not exactly 8 bits
	
	// Return 2 if a single dot is followed by more than 2 spaces
	
	// Initialize Things 
	int index;			//Store the index to count # of spaces
	int spaceCount = -1;
	char currentChar;			//Store current char 
	bool error = false;		//Begins as false, set to true if an error is returned

	// Loop through entire file
	while( !EOF ){
		fscanf(stdin, "%c", &currentChar);
	
		if(currentChar == '.'){		// Find period
			fscanf(stdin, "%c", &currentChar);	// Skip to the next char
			spaceCount ++;
	
			while(currentChar == ' '){		// loop through however many spaces there are
				spaceCount ++;		// Count spaces
				fscanf(stdin, "%c", &currentChar);

				if(spaceCount > 2){
					// Don't need to reset variables since error causes program to stop running
					printf("There was an error 2");
					return 2;
				}
			}
		}
		printf("space count: %d\n", spaceCount);
		spaceCount = -1;
	}
	
	return 0;
}
