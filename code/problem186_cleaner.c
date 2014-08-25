#include<stdio.h>
#include <string.h>

#define SUBSCRIBERS 1000000

int parent[SUBSCRIBERS], rank[SUBSCRIBERS], size[SUBSCRIBERS];

int find(int x) {
	if(parent[x] == x)
		return x;
	return parent[x] = find(parent[x]); 
}
int max(int a, int b)
{
	if(a > b)
		return a;
	return b;
}
void unite(int x, int y) {
	int nodex = find(x);
	int nodey = find(y);
	if(nodex == nodey)
		return;

	if(rank[nodex] > rank[nodey]) {
		int tmp = nodex;
		nodex = nodey;
		nodey = tmp;
	}

	rank[nodey] = max(rank[nodey], rank[nodex] + 1);
	parent[nodex] = nodey;
	size[nodey] += size[nodex];
}

main() {
	long long i, j;
	int calls[55];
	int successful;

	for(i = 0; i < SUBSCRIBERS; i++) {
		parent[i] = i;
		size[i] = 1;
	}

	for(i = 1; i <= 55; i++) {
		calls[i-1] = (100003 - 200003 * i + 300007 * i * i * i) % SUBSCRIBERS;
		if(i % 2 == 0)
			unite(calls[i-1], calls[i-2]);
	}
	
	for(i = 56;;i++) {
		int S = (calls[31] + calls[0]) % SUBSCRIBERS;
		for(j = 1; j < 55;j++)
			calls[j-1] = calls[j];

		calls[54] = S;
		if(i % 2 == 0)
			continue;

		int caller = calls[54];
		int called = calls[53];
		if(caller == called)
			continue;

		successful++;
		unite(caller, called);

		if(size[parent[524287]] >= 990000) {
			printf("%i\n", successful);
			return;
		}
	}
}





