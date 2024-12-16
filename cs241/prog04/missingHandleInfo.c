// @Author Ryan Scherbarth 
// last modified: 03/07/23
// cs241 project 4, Images 

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

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
void invert(char* input, int row, int col){
	int i;
	for(i=0; i < (row * col); i++){
		if(*input == ' '){
			*input = '*';
		}else {
			*input = ' ';
		}
		input ++;
	}
}
// Function to flip
void flip(char* input, int row, int col, char I){
	int i, j;
	char* start = input;
	char* end = input + (col -1);
	if(I == 'H' || I == 'h'){ 	// Could probably do this better w/ toUpperCase or something but whatever
		int mid = col/2;
		for(i=0; i<row; i++){
			for(j=0; j<mid; j++){
				char temp = input[i * col + j];
				input[i * col + j] = input[(i + 1) * col - j - 1];
				input[(i + 1) * col - j - 1] = temp;
			}
		}
	}else if(I == 'V' || I == 'v'){
		int i, j;
		int mid = row/2;
		int offset = col * (row - 1);

		for(i=0; i<mid; i++){
			for(j=0; j<col; j++){
				char temp = input[i * col + j];
				input[i * col + j] = input[offset - i * col + j];
				input[offset - i * col + j] = temp;
			}
		}
	}else{
		printf("Not a valid type of flip, expected H or V.\n");
		exit(1);
	}
}
// Function to rotate 
void rotate(char* input, int row, int col, int deg){
	int i, j;
	if(deg != 90 && deg != 180 && deg != 270){
		printf("This is not a valid degree\n");
		exit(1);
	}
	char* temp = (char*) malloc(row * col * sizeof(char)); 	// Save memory cor calc
	if(deg == 90){ 	// TODO make this a swtich case to look prettier
		for(i=0; i<row; i++){
			for(j=0; j<col; j++){
				temp[j * row + row - i - 1] = input[i * col + j];
			}
		}
	}else if(deg == 180){
		for(i=0; i<row; i++){
			for(j=0; j<col; j++){
				temp[(row - i - 1) * col + col - j - 1] = input[i * col + j];
			}
		}
	}else{
		for(i=0; i<row; i++){
			for(j=0; j<col; j++){
				temp[(col - j - 1) * row + i] = input[i * col + j];
			}
		}
	}
	memcpy(input, temp, row*col*sizeof(char));
	free(temp);
}
// Stetch function
char* stretch(char* input, int row, int *col, int factor) {
	int i,j,k,l;
	char* output = (char*) malloc(row* *col*factor * sizeof(char));
  for (i = 0; i < row; i++) {
    for (j = 0; j < *col; j++) {
    	char pixel = input[i* *col + j];
      for (k = 0; k < factor; k++) {
				*(output + i * *col * factor + j * factor + k) = pixel;
      }
    }
  }
  //memcpy(input, output, row * sizeof(char));
  //free(output);
  *col = *col * factor;
	return output;
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

//	for argc){
//	strcmp(argc[i], "stretch") == 0){
//			// i + one for length of stretch
//			//
//		} 
//}
	
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
	photo = stretch(photo, row, &col, 2);
	


	printf("before: \n");
	for(i=0; i<row; i++){
		for(j=0; j<col; j++){
			printf("%c", *photo++);
		}
		printf("\n");
	}
	photo = photo - (row * col);



	// Ignore for trouble shooting
	printf("row value: %i\n", row);
	printf("col value: %i\n", col);

	printf("\n");
	printf("Done");
		
}
