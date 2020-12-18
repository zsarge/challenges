package main

import (
	"fmt"
	"strings"
)

const OPENS = "([{"

var CLOSES = map[string]string{
	")": "(",
	"]": "[",
	"}": "{",
}

func isValid(s string) bool {
	stack := ""
	if len(s)%2 != 0 {
		return false
	}
	for _, c := range s {
		if strings.Contains(OPENS, string(c)) {
			stack += string(c)
		} else {
			newQueue := strings.TrimSuffix(stack, CLOSES[string(c)])
			if stack == newQueue {
				// could not remove last char
				return false
			}
			// removal was successful
			stack = newQueue
		}
	}
	if len(stack) != 0 {
		return false
	}
	return true
}

func test(s string) {
	fmt.Println(s)
	fmt.Println(isValid(s))
	fmt.Println("")
}

func main() {
	test("[")
	test("((")
	test("()")
	test("(]")
	test("({[]})")
	test("({[}]})")
	test("({[{}{}]})")
	// test("({[]})")
}
