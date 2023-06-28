/*
 * Example of how to read line, by line. provided by
 * https://zetcode.com/golang/readfile/
 */

package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
    "regexp"
)



func scan_file() {
    re := regexp.MustCompile(`^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$`)

    fmt.Printf("Using Pattern for regex\n: %v\n", re.String()) // print pattern

    f, err := os.Open("../input/sample_input.txt")
    if err != nil {
        log.Fatal(err)
    }

    defer f.Close()
    scanner := bufio.NewScanner(f)

    for scanner.Scan() {
        //fmt.Println(scanner.Text())
	//str cc_number := scanner.Text()
	cc_number := scanner.Text()
	fmt.Printf("CC : %v :%v\n", cc_number, re.MatchString(cc_number))
    }

    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }
}

