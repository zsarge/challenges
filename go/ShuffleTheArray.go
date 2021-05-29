// Challenge name: Shuffle the array
// Challenge link: https://leetcode.com/problems/shuffle-the-array/
// Completed by Zack Sargent on: March/11/2021
// Notes: This is just for me to practice go
// Resources: None

// to run this script, do `go run ShuffleTheArray.go`

package main

import (
	"fmt"
)

func shuffle(nums []int, n int) []int {
	var result []int
	firstHalf := nums[:n]
	lastHalf := nums[n:]

	for i := 0; i < n; i++ {
		result = append(result, firstHalf[i])
		result = append(result, lastHalf[i])
	}
	return result
}

func main() {
	n := 3
	array := []int{2, 5, 1, 3, 4, 7}
	fmt.Println(shuffle(array, n))
}
