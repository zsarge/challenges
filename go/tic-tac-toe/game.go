package main

type Board struct {
	data   [3][3]rune
	player bool
}

func NewBoard() *Board {
	b := new(Board)
	count := 1
	for y := 0; y < 3; y++ {
		for x := 0; x < 3; x++ {
			b.data[y][x] = rune(count + '0')
			count++
		}
	}
	return b
}

func (_ *Board) Won() bool {
	// TODO: Implement
	return false
}


