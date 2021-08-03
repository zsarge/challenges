// https://www.codewars.com/kata/57eae20f5500ad98e50002c5/train/go
// ngl, this solution kinda sucks

package main

import (
	"fmt"
)

func solution(str, ending string) bool {
	if len(ending) == 0 {
    return true
  }
  if len(str) == 0 {
		return false
	}
	for i := 1; i <= len(ending); i++ {
		if str[len(str) - i] != ending[len(ending) - i] {
			return false
		}
	}
	return true
}


func test(str, ending string) {
	fmt.Println(str, ending, "=", solution(str, ending))
}

func main() {
	test("banana", "ana")
	test("z", "a")
	test(" ", "")
}
