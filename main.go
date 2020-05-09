package main

import (
	"log"
	"net/http"
)

func main() {
	// Simply serve the main website
	fs := http.FileServer(http.Dir("./website"))
	http.Handle("/", fs)

	log.Println("Listening on :3003...")
	err := http.ListenAndServe(":3003", nil)
	if err != nil {
		log.Fatal(err)
	}
}
