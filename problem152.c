#include <stdio.h>



int number_of_ways(int n, int max, float target, float sum) {
	if(sum == target) {
		printf("Found SUM!\n");
		return 1;
	}

	if(sum > target)
		return 0;

	printf("%f\n", sum);
	
	int c = 0;
	int i;
	for (i = n+1; i <= max; i++) {
		c += number_of_ways(i, max, target, sum + 1.0f / (i*i));
		printf("%i\n", i);
		c++;
		if(c == 2)
			return 0;
	}

	return c;
}

main() {
	int val = number_of_ways(2, 35, 0.5, 0);
	printf("%i\n", val);
}