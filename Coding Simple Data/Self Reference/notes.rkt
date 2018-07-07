;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; List mechanisms
;; These are ways for representing arbitrary amounts of data

;; Mechanisms for making lists

(require 2htdp/image)

empty   ;;an empty list of something
(cons "Flames" empty) ;;Add Flames to the list
(define LIST2 (cons "Leafs" (cons "Flames" empty)))
(define LIST (cons (string-append "C" "anucks") empty))

;; We can make lists of images and other primitive data types
;; Technically we can make lists with different types of data, but we don't like to do that

;; Primitives for finding out what's in a list

;; first gives us the first element in a list
;; rest gives us the rest of the list
;; To get the second element in a list, you would
;; do (first (rest List))

(empty? empty) ;;empty? returns true if a list is empty
