package main

import (
	"errors"
	"fmt"
	"strconv"
)

func (b *Board) Print() {
	for _, row := range b.data {
		for i, cell := range row {
			if i != 0 {
				fmt.Print("|")
			}
			fmt.Print(string(cell))
		}
		fmt.Println()
	}
}

func promptUser() (int, error) {
	var input string
	fmt.Print("Please choose a value: ")
	fmt.Scanln(&input)

	choice, err := strconv.Atoi(input)

	if err != nil {
		// error in parsing input
		return 0, err
	} else if 1 <= choice && choice <= 9 {
		// ensure input is within board size
		return choice, nil
	} else {
		return 0, errors.New("Choice needs to be between 1 and 9")
	}
}

func getInput() int {
	for true {
		choice, err := promptUser()
		if err == nil {
			return choice
		}
	}
	return 0
}

func (b *Board) MakeMove() {
	input := getInput()
	x := (input - 1) % 3
	var y int
	if input <= 3 {
		y = 0
	} else if input <= 6 {
		y = 1
	} else {
		y = 2
	}

	if b.player {
		b.data[y][x] = 'X'
	} else {
		b.data[y][x] = 'O'
	}

	b.player = !b.player
}
