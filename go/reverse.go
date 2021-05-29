// Challenge name: Reverse
// Completed by Zack Sargent on: May/28/2021
// Notes: This was done competing with a 
// friend who was completing the same challenge in C.

/* 
Challenge Description:
Make a program that can reverse all lines in standard input.

How to use this program (assuming you're on a linux system):

1. `go build reverse.go`
2. `echo reverseMe! | ./reverse`
-> !eMesrever

*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

func reverse(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		fmt.Println(reverse(scanner.Text()))
	}
}
