NORMAL_FLAGS = -Wall -Wextra -Wconversion -pedantic -std=gnu11

string_practice:
	gcc main.c $(NORMAL_FLAGS) -o a.out

optimized:
	gcc main.c -O4 -o a.out

debug:
	gcc main.c -g $(NORMAL_FLAGS) -o a.out && gdb a.out

run:
	gcc main.c $(NORMAL_FLAGS) -o a.out && ./a.out
