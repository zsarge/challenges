// Challenge name: Reverse
// Completed by Zack Sargent on: May/28/2021
// Notes: This was done competing with a
// friend who was completing the same challenge in C.

/*
Challenge Description:
Make a program that can reverse all lines in standard input.

How to use this program (assuming you're on a linux system):
$ go build reverse.go
$ echo -e "reverse line 1\n reverse line 2" | ./reverse -
1 enil esrever
2 enil esrever
$ ./reverse "all words"
sdrow lla
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func reverse(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

func reverseStdin() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		fmt.Println(reverse(scanner.Text()))
	}
}

func reverseArguments() {
	allArgs := strings.Join(os.Args[1:], "")
	fmt.Println(reverse(allArgs))
}

func main() {
	if len(os.Args) <= 1 {
		fmt.Println("Error: please pass at least one argument")
		fmt.Println("Pass `-` to reverse lines from stdin.")
		fmt.Println("Pass anything else to be reversed.")
		os.Exit(1)
	}

	if len(os.Args) == 2 && os.Args[1] == string('-') {
		reverseStdin()
	} else {
		reverseArguments()
	}
}
