package main

import (
    "fmt"
    "io/ioutil"
    "log"
)

func main() {
    content, err := ioutil.ReadFile("../input/sample_input.txt")

     if err != nil {
          log.Fatal(err)
     }

    fmt.Println(string(content))
}

