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
// Package error contains the examples shown on Golang Costa Rica meetup
// https://www.meetup.com/Golang-Costa-Rica/events/270127485/
package error

import (
	"fmt"
)

// // custom error
// var errNotFound error = errors.New("not found error")

// // custom error implementation
// type errorDecorator struct {
// 	msg string
// 	err error
// }

// func newError(msg string, err error) *errorDecorator {
// 	return &errorDecorator{msg: msg, err: err}
// }

// func (e *errorDecorator) Error() string {
// 	return fmt.Sprintf("Error received: %s \n", e.msg)
// }

// func (e *errorDecorator) Unwrap() error { return e.err }

func Demo() {
	// error when no checking for errors

	// error with custom message checking
	// err := newError()
	// if err != nil {
	// 	panic(err)
	// }

	// no error handling checking
	// msg, _ := noError()
	// fmt.Print(msg)

	// custom error implementation checking
	// err := decoratorError()
	// if err != nil {
	// 	if e, ok := err.(*errorDecorator); ok && e.err == errNotFound {
	// 		fmt.Print("Type errNotFound found \n")
	// 	}
	// }

	// error handling Go 1.13
	// err := decoratorError()
	// if errors.Is(err, errNotFound) {
	// 	fmt.Print("Type errNotFound found \n")
	// }

	// var e *errorDecorator
	// if errors.As(err, &e) {
	// 	fmt.Print("Type errorDecorator found \n")
	// }

	fmt.Printf("Golang error handling demo code\n")
}

// add an error with a custom message
// func newError() error {
// 	err := errors.New("New error")

// 	return err
// }

// return a message and an error to show error checking
// func noError() (string, error) {
// 	return "", errors.New("New error")
// }

// return an error to check error decoration functionality
// func decoratorError() error {
// 	err := newError("my custom error", errNotFound)
// 	return err
// }
