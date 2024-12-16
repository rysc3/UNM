// @Author Ryan Scherbarth 
// last modified: 03/07/23
// cs241 project 4, Images 

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

// Function to find last index in the argV array
int lastI(char *in[]){
	int i=0;
	// Calculate the last position of the input arguments array
	for(i=0; in[i] != NULL; i++){
		if(strlen(in[i]) == 0){
			break;
		}
	}
	return i-1;
}
// Function to invert
void invert(char** input, int row, int col){
	int i, j;
	for(i=0; i<row; i++){
		for(j=0; j<col; j++){
			if(input[i][j] == ' '){
				input[i][j] = '*';
		}else if(input[i][j] == '*'){
				input[i][j] = ' ';
			}
		}
	}
}
int main(int argc, char *argv[]){
	// I always forget to gcc in the correct version or whatever so these go here lol
	int i, j;
	int row=0;
	int col=0;
	int C=0; 

	// Open & read file
	// char* input = argv[lastI(argv)]; // file should be last input given
	fscanf(stdin, "%i %i", &row, &col);
	printf("Row is %i\n", row);
	printf("Col is %d\n", col);	
	
	// allocate and fill array
	char* photo = (char*) malloc(row * sizeof(char*) * col);

	i=0;
	j=0;
	while((C = getchar()) != EOF){
		if(C == '\n'){ 	// Reset indexes when you get to a new line
			//printf("Something went wrong here");
		}else{
			*photo = C;
			photo ++;
		}
	}
	photo = photo - (row * col); 	// Reset photo index
//	for(i=0; i<row; i++){
//		for(j=0; j<col; j++){
//			photo[i][j] = 
//		}
//	}


	
	printf("before: \n");
	for(i=0; i<row; i++){
		for(j=0; j<col; j++){
			printf("%c", *photo++);
		}
		printf("\n");
	}
	photo = photo - (row * col); 	// Reset photo index
	printf("Made it to here");

	
	// Main thingy for main lol, throws to all the other functions
	//invert(photo, row, col);



	// Ignore for trouble shooting
	printf("row value: %i\n", row);
	printf("col value: %i\n", col);

//	printf("Output: \n");
//	for(i=0; i<row; i++){
//		for(j=0; j<col; j++){
//			printf("%c", photo[i][j]);
//		}
//	}
	printf("\n");
	printf("Done");
		
}
