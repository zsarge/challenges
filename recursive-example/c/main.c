#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * The caller is in charge of freeing the string passed to `history`.
 * This returns a new pointer.
 */
char* insert_into_string(char* history, const char* operation)  {
	size_t size = strlen(history) + strlen(operation) + 4;
	char* str = malloc(size);
	sprintf(str, "(%s %s)", history, operation);
	return str;
}

/*
 * The caller is in charge of freeing the string passed to `history`.
 * This returns a new pointer.
 */
char* find(int target, int current, char* history) {
	if (current == target) {
		return strdup(history);
	} else if (current > target) {
		return NULL;
	} else {
		char* plus_5 = insert_into_string(history, "+ 5");
		char* times_3 = insert_into_string(history, "* 3");

		char* result_5 = find(target, current + 5, plus_5);
		char* result_3 = find(target, current * 3, times_3);

		free(plus_5);
		free(times_3);

		if (result_5 != NULL) {
			if (result_3 != NULL) {
				free(result_3);
			}
			return result_5;
		} else if (result_3 != NULL) {
			return result_3;
		} else {
			return NULL;
		}
	}
}

char* find_solution(int target) {
	char* str = strdup("1");
	char* result = find(target, 1, str);
	free(str);
	if (result == NULL) 
		return strdup("no solution");
	else
		return result;
}

void test(int n) {
	char* solution = find_solution(n);
	printf("%s\n", solution);
	free(solution);
}

int main(void) {
	test(253);
}

