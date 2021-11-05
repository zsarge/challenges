/* This is a basic LinkedList implementation in C.
 * Written by Zack Sargent on November 4th, 2021.
 */

#include <stdio.h>
#include <stdlib.h>

struct Node {
	struct Node *next;
	int value;
};

struct LinkedList {
	struct Node *head;
};

struct LinkedList *make_list(void) {
	struct LinkedList *list = malloc(sizeof(struct LinkedList));
	if (!list)
		return NULL;
	list->head = NULL;
	return list;
}

struct Node *create_node(int value) {
	struct Node *node = malloc(sizeof(struct Node));
	if (!node)
		return NULL;
	node->next = NULL;
	node->value = value;
	return node;
}


void display_with_index(struct Node node, int index) {
	if (index == 0)
		printf("head\t= %d\n", node.value);
	else
		printf("%d\t= %d\n", index, node.value);

	if (node.next != NULL)
		display_with_index(*node.next, index + 1);
}

void push_back(struct Node *node, struct LinkedList *list) {
	if (list->head == NULL) {
		list->head = node;
		return;
	}
	struct Node *current = list->head;
	while (current->next != NULL) 
		current = current->next;
	current->next = node;
}

void pop_back(struct LinkedList *list) {
	if (list->head == NULL) {
		return;
	} 
	struct Node *current = list->head;
	struct Node *previous = current;
	while (current->next != NULL) {
		previous = current;
		current = current->next;
	}
	previous->next = NULL;
	free(previous->next);
}

void display(struct Node *node) {
	display_with_index(*node, 0);
}

void display_list(struct LinkedList *list) {
	int index = 0;
	printf("Displaying List:\n");
	for (struct Node *current = list->head; current != NULL; current = current->next) {
		printf("%d = %d\n", index++, current->value);
	}
}

void delete_list(struct LinkedList *list) {
	for (struct Node *current = list->head; current != NULL; current = current->next) {
		free(current);
	}
	free(list);
}

int main(void) {
	// construct list
	struct LinkedList *list = make_list();

	// add data
	push_back(create_node(10), list);
	push_back(create_node(20), list);
	push_back(create_node(30), list);
	pop_back(list);

	// show it
	display_list(list);

	// destroy list
	delete_list(list);
}

