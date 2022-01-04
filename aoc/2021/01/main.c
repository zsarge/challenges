// https://adventofcode.com/2021/day/1

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INPUTS_SIZE 2000

int* get_inputs() {
	// assume we will always have 2000 inputs
	int* inputs = (int*) malloc(INPUTS_SIZE * sizeof(int));

	FILE* file_pointer;
	const int buffer_length = 5;
	char buffer[buffer_length];

	file_pointer = fopen("input1.txt", "r");

	if (file_pointer == NULL) {
		perror("`input1.txt` was not found.\n");
		exit(1);
	}

	int i = 0;
	while (fgets(buffer, buffer_length, file_pointer)) {
		if (buffer[0] != '\n') {
			// Note: Don't use `atoi` in the real world.
			inputs[i] = atoi(buffer);
			i++;
		}
	}

	fclose(file_pointer);

	return inputs;
}

int part_1(const int* inputs) {
	int count_increased = 0;
	for (int i = 0; i < INPUTS_SIZE - 1; i++)
		if (inputs[i] < inputs[i+1])
			count_increased++;
	return count_increased;
}

int part_2(const int* inputs) {
	int count_increased = 0;
	for (int i = 0; i < INPUTS_SIZE - 3; i++) {
		int a = inputs[i] + inputs[i+1] + inputs[i+2];
		int b = inputs[i+1] + inputs[i+2] + inputs[i+3];
		if (a < b)
			count_increased++;
	}
	return count_increased;
}

int main(void) {
	int* inputs = get_inputs();
	printf("%d\n", part_1(inputs));
	printf("%d\n", part_2(inputs));
}

