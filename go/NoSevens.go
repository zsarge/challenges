// Challenge name: No Sevens
// Challenge link: https://www.learneroo.com/modules/20/nodes/157
// Completed by Zack Sargent on: March/11/2021
// Notes: This is just for me to practice go
// Resources: None

// to run this script, do `go run NoSevens.go`

package main

import (
	"fmt"
	"strconv"
	"strings"
)

func shouldFilter(n int) bool {
	if n%7 == 0 {
		return false
	}
	if strings.Contains(strconv.Itoa(n), "7") {
		return false
	}
	return true
}

func main() {
	for i := 0; i <= 50; i++ {
		if shouldFilter(i) {
			fmt.Println(i)
		}
	}
}
