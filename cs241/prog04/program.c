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
	int og_col = *col;
	char* output = (char*) malloc(row* og_col*factor * sizeof(char));
  for (i = 0; i < row; i++) {
    for (j = 0; j < og_col; j++) {
    	char pixel = input[i* og_col + j];
      for (k = 0; k < factor; k++) {
				pixel = (output + i * og_col * factor + j * factor + k);
      }
    }
  }
  *col = og_col * factor;
	return output;
}


void print(char* input, int row, int col){
	int i, j;
	for(i=0; i<row; i++){
		for(j=0; j<col; j++){
			printf("%c", *input++);
		}
		printf("\n");
	}
}
int main(int argc, char *argv[]){
	// I always forget to gcc in the correct version or whatever so these go here lol
	int i, j;
	int row=0;
	int col=0;
	int C=0;

	// Set row & col values
	if(scanf("%d %d", &row, &col) != 2){
		printf("Not a valid file dimension.\n");
		exit(1);
	} 
	// allocate and fill array
	char* photo = (char*) malloc(row * col * sizeof(char*));
	//char* photo = malloc(row * col * sizeof(char));

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

//	// Handle user input, do things
//	for(i=1; i<argc; i++){
//		if(strcmp(argv[i], "rot") == 0){
//			printf("%s\n", argv[i]);
//			int deg;
//			scanf("%i", &deg);
//			printf("%d\n", deg);
//			stretch(photo, row, &col,(int) argv[i+1]);
//			i++; 	// Skip an extra i past the num 
//		}else if(strcmp(argv[i], "flip") == 0){
//			flip(photo, row, col, (char) argv[i+1]);
//			i++; 	// Skip extra i past the char
//		}else if(strcmp(argv[i], "inv") == 0){
//			invert(photo, row, col);
//		}else if(strcmp(argv[i], "stretch") == 0){
//			stretch(photo, row, col, (int) argv[i+1]);
//		}else{
//			printf("%s\n", *argv[i]);
//			printf("Not a valid input\n");
//		}
//	}
	print(photo, row, col);
	stretch(photo, row, &col, 2);
	print(photo, row, col);
}
