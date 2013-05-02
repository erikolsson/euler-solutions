#include <stdio.h>

main() {
	int i;
	int triangle[16];
	for(i = 0; i < 16; i++)
		triangle[i] = 0;
	triangle[0] = 3;

	int row;
	for(row = 0; row < 4; row++) {
		int index = 0;
		for(i = row*row; i < row*row + 2*row + 1; i++) {

			if(index == 0) {
				triangle[i] = 3;
			}
			else if(index % 2 == 1) {
				triangle[i] = 2;
			}
			else {
				triangle[i] = 1;	
			}
			if(i > 0)
				triangle[i] *= triangle[i-1];
			index++;

		}
	}
	printf("%i\n", triangle[15]);
	
	
}