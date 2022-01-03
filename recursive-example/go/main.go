package main

import (
	"fmt"
	"errors"
)

func find(target, current int, history string) (string, error) {
	if current == target {
		return history, nil
	} else if current > target {
		return "", errors.New("no solution")
	} else {
		str_a, err_a := find(target, current + 5, fmt.Sprintf("(%s + 5)", history))
		str_b, err_b := find(target, current * 3, fmt.Sprintf("(%s * 3)", history))

		if err_a == nil {
			return str_a, nil
		} else if err_b == nil {
			return str_b, nil
		} else {
			return "", errors.New("no solution")
		}
	}
}

func findSolution(target int) string {
	str, err := find(target, 1, "1")
	if err != nil {
		return "no solution"
	}
	return str
}

func main() {
	fmt.Println(findSolution(253))
}


