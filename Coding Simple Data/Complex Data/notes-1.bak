;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname notes-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Complex Data

;; Examples: first and last name, x and y coordinate

;; These are situations in which two or more values naturally belong together

;; Define-struct allows us to create compound values

(define-struct pos (x y)) ;; x and y are "field names"

(make-pos 3 5) ;; this is a constructor that creates a pos

;; Defining a struct creates 4 different functions
;; make-x is a constructor
;; pos-x gets you the value for x of a given pos
;; pos-y gets you the value for y of a given pos
;; pos? is a predicate that returns true if the argument is a pos

(define P1 (make-pos 3 6))
(define p2 (make-pos 2 8))

(pos-x P1)
