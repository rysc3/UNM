nclude <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

bool checkValid(){
    int row, col;
    if(fscanf(stdin, "%i %i", &row, &col) != 2){
        return false;
    }   
    return true;
}

int lastI(char *in[]){
    int i;
    for(i=0; in[i] != NULL; i++){
        if(strlen(in[i]) == 0){
            break;
        }
    }
    return i-1;
}

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
    int i, j, row=0, col=0, C=0;
    char* input = argv[lastI(argv)];
    if(checkValid() == false){
        exit(1);
    }else{
        fscanf(stdin, "%i %i", &row, &col);
        printf("measurements: %i, %i", row, col);
    }
		char** photo = (char**) malloc(row * sizeof(char*));
		for(i=0; i<row; i++){
	    photo[i] = (char*) malloc(col * sizeof(char));
		}

		if(!checkValid(argv)){ // Use ! to negate the boolean return value
    fprintf(stderr, "Invalid input file\n");
    exit(1); // Exit with error code		
		}

