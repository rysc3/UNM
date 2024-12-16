#include <stdio.h>
#include <stdbool.h>

// Ryan Scherbarth 
// CS241 Porjecet 3, Steganoraphy 
int main(){
	// Initialize Things 
	int bitcount = 0;			// Index for bits seen so far of current character
	int spaceCount = -1;  // Count # of spaces in each section (set to -1 to produce proper 0 & 1 outputs)
	char currentChar;			// Store current char 
	char messageChar;			// Store output 
	// bool error = false;		// Begins as false, set to true if an error is returned

	fscanf(stdin, "%c", &currentChar);  // Starts looking at first char of the file
	while( currentChar != EOF ){  // Continue looping through below operation until you reach end of file or some other type of error.
	
		if(currentChar == '.'){		// Find period
			fscanf(stdin, "%c", &currentChar);	// Skip to the next char
	
			while(currentChar == ' '){		// loop through however many spaces there are
				spaceCount ++;		// Count spaces
				fscanf(stdin, "%c", &currentChar);
				
				if(spaceCount > 2){

					if(bitcount % 8 != 0){	// Return error code 1 if output isn't in 8 bit increments
						return 1;
					}else {		// Return 0 (end program successfully)
						return 0;
					}
				}
			}
			// Add one more bit to current char
			if(spaceCount == 0){
				messageChar = messageChar << 1; // Adds a 0 to the right side of bit stream
				bitcount ++;  
			}else if(spaceCount == 1){
				messageChar = (messageChar << 1) + 1; // Adds a 1 to the right side of the bit stream
				bitcount ++;
			}

			if(bitcount == 8){  // Only convert to char & print after you have 8 bits
				printf("%c", messageChar);
				bitcount = 0; // Reset bit count
			}
		}
		spaceCount = -1;  // Reset spaceCount int
		fscanf(stdin, "%c", &currentChar); // Print out char created with 8 bits above 
	}
	return 2; // No stopping signal was found (> 2 spaces)	
}
// Yay it finall worked :D
