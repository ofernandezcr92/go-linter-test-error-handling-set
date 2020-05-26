package main

import "fmt"

func Sum(x, y int) int {
	return x + y
}

func main() {
	sum := Sum(4, 5)
	fmt.Println(sum)
}
