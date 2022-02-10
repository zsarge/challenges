package main

/*
 * Run with: `go run .`
 */

func main() {
	board := NewBoard()
	for !board.Won() {
		board.Print()
		board.MakeMove()
	}
}
