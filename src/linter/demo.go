/**
 *  _             _ _| |_
 * | |           | |_   _|
 * | |___  _   _ | | |_|
 * | '_  \| | | || | | |
 * | | | || |_| || | | |
 * |_| |_|\___,_||_| |_|
 *
 * (c) Huli Inc
 */
// Package linter contains the examples shown on Golang Costa Rica meetup
// https://www.meetup.com/Golang-Costa-Rica/events/270127485/
package linter

import "fmt"

func Demo() {
	// this command must be linted by go vet
	// v := 10 //-> go vet -assign main.go -> go vet -all
	fmt.Printf("Golang linter demo code")
}

// this function must be linted by ./run.sh lint(golangci-lint)
// func noUsed() {

// }
