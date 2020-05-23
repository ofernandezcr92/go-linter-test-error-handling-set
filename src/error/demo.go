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
package error

import "fmt"

func Demo() {
	// this command must be linted by go vet
	// v := 10 //-> go vet -assign main.go -> go vet -all
	fmt.Printf("Golang error handling demo code\n")
}
