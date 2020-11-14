/* match.c
 * This is a program that returns all lines from stdin
 * that include the argument given to this program.
 * 
 * Example usage:
 * 		cat wordList.txt | ./match SUBSTRING
 * 
 * Zack Sargent - 11/14/20
 */

#include <stdio.h>
#include <string.h>

void printHelp()
{
	printf("This is a program that returns all lines from stdin\n");
	printf("that include the argument given to this program.\n");
	printf("\n");
	printf("Example usage:\n");
	printf("\tcat wordList.txt | ./match SUBSTRING\n");
}

int main(int argc, char *argv[])
{
	char *line = NULL;
	size_t len = 0;

	if (argc != 2)
	{
		printf("match takes one argument\n");
		return -1;
	}

	if (argv[1][0] == '-')
	{
		printHelp();
		return 0;
	}

	// read from stdin
	while (getline(&line, &len, stdin) != -1)
	{
		// strstr returns a pointer if substring exists
		if (strstr(line, argv[1]) != NULL)
		{
			printf("%s", line);
		}
	}

	return 0;
}
