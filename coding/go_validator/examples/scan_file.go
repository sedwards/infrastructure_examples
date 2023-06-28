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
)

func scan_file() {

    f, err := os.Open("../input/sample_input.txt")

    if err != nil {
        log.Fatal(err)
    }

    defer f.Close()

    scanner := bufio.NewScanner(f)

    for scanner.Scan() {

        fmt.Println(scanner.Text())
    }

    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }
}

