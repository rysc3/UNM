#include <stdio.h>
#include <string.h>

int main(){
	char *word = "Alice";
	char *returnArr;

	printf("String: %s\n", word);
	int i;
	int j;
	for(i=0; i<strlen(word); i++){
		printf("decimals: ");
		printf("%d\n", (word[i]<<8));
		for(j=0; j<strlen(word)-1; j++){
			returnArr += (word[i]<<8)^4; 
		}
	}
	printf("Ret Array:");
	printf(returnArr);
}
