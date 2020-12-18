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
	queue := ""
	if len(s)%2 != 0 {
		return false
	}
	for _, c := range s {
		if strings.Contains(OPENS, string(c)) {
			queue += string(c)
		} else {
			newQueue := strings.TrimSuffix(queue, CLOSES[string(c)])
			if queue == newQueue {
				return false
			}
			queue = newQueue
		}
	}
	if len(queue) != 0 {
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
