#include<stdio.h>
#include <string.h>

int sizes[1000000];
int parents[1000000];
int ranks[1000000];

int find(int x)
{
	if(parents[x] == x)
		return x;
	return parents[x] = find(parents[x]);
}

int max(a, b)
{
	if(a > b)
		return a;
	return b;
}

void unionFind(x, y) {
	int nodex = find(x);
	int nodey = find(y);
	if(nodex == nodey)
		return;
	
	if(ranks[nodex] > ranks[nodey]) {
		int tmp = nodex;
		nodex = nodey;
		nodey = tmp;
	}

	ranks[nodey] = max(ranks[nodey], ranks[nodex]+1);
	parents[nodex] = nodey;
	sizes[nodey] += sizes[nodex];
}

main()
{
	long long i = 0;
	int calls[55];
	int successful = 0;

	for(i = 0; i <= 1000000;i++) {
		parents[i] = i;
		sizes[i] = 1;
	}

	for (i = 1; i <= 55; i++) {
		calls[i-1] = (100003 - 200003 * i + 300007 * i * i * i) % 1000000;
		if(i % 2 == 0 ) {
			unionFind(calls[i-1], calls[i-2]);
			successful++;
		}
	}

	int j;
	for(i = 56; ; i++) {
		int S = (calls[31] + calls[0]) % 1000000;
		for(j = 1; j<55;j++)
			calls[j-1] = calls[j];

		calls[54] = S;

		if(i % 2 != 0)
			continue;

		int caller = calls[53];
		int called = calls[54];

		if(caller == called)
			continue;

		unionFind(caller, called);
		successful++;
		
		if(sizes[parents[524287]] >= 990000)
		{
			printf("99%% of the subscribers connected after %i calls.\n", successful);
			return;
		}
	}
}