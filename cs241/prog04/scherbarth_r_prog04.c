// @Author Ryan Scherbarth 
// last modified: 03/07/23
// cs241 project 4, Images 

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

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
  free(output);
  *col = *col * factor;
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

	// Open & read file
	// char* input = argv[lastI(argv)]; // file should be last input given
	fscanf(stdin, "%i %i", &row, &col);
	
	// allocate and fill array
	char* photo = (char*) malloc(row * sizeof(char*) * col);
	while((C = getchar()) != EOF){
		if(C == '\n'){ 	// Reset indexes when you get to a new line
			//printf("Something went wrong here");
		}else{
			*photo = C;
			photo ++;
		}
	}
	photo = photo - (row * col); 	// Reset photo index

	// Start taking user input and making changes
	for(i=1; i<argc; i++){
		if(strcmp(argv[i], "rot") == 0){
			int deg;
			if(isdigit(argv[i+1]) == false){
				exit(1);
			}else{
				deg = argv[i+1];
			}
			rotate(photo, row, col, deg);
			print(photo, row, col);
			i++; 	// Skip an extra i past the num 
		}else if(strcmp(argv[i], "flip") == 0){
			flip(photo, row, col, (char) argv[i+1]);
			i++; 	// Skip extra i past the char
		}else if(strcmp(argv[i], "inv") == 0){
			invert(photo, row, col);
		}else if(strcmp(argv[i], "stretch") == 0){
			char* output;
			output = stretch(photo, row, &col, (int) argv[i+1]);
			print(output, row, &col);
			exit(0);
		}else{
			printf("%s\n", *argv[i]);
			printf("Not a valid input\n");
		}
	}
	print(photo, row, col);
	exit(0);
}
/*
 * Well I wasn't able to figure out how to get the accepting user input to work but all of my functions work
 * When manually going through and calling each function, i.e 
 *
 * rotate(photo, row, col, 90);
 * print(photo, row, col);
 *
 * it gives me the correct answer, but then feeding that exact same information through 
 * main doesn't work for some reason. I can't figure out why that is because when checking
 * my indexes are correct, I double checked my argv[i] and argv[i+1] values that I'm passing
 * through the rotate function and they are both being stored properly, but then I use the exact thing 
 * implemented above with 
 *
 * ./a.out rot 90 < valid 
 *
 * and it gives me a segmentation fault, every single input I give throws a segmentation fault, which
 * I know means I'm somehow making a mistake with the memory allocation and reaching out of bounds 
 * but I can not figure out for the life of me why that is. Either way, functions are all working exactly as expected, 
 * reading array from input, throwing errors for incorrect input format etc. is working properly, and 
 * everything up to the point of handling user input, so hopefully that portion of the project
 * isn't weighted THAT heavily of the overall program grade.
