#include<stdio.h>
#include <string.h>


main()
{
	int n = 60000;
	int ways[n+1];
	int i, j;
	for(i = 0; i <= n; i++)
		ways[i] = 0;
	
	ways[0] = 1;
	
	for(i = 1; i <= n; i++) {
		for(j = i; j <= n; j++) {
			ways[j] += ways[j-i];
			ways[j] %= 1000000;
			if(ways[i] == 0) {
				printf("%i\n", i);
				break;
			}
		}
	}
}


