;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname function_recipe) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;How to design functions recipe


;example 1
;Design a function that consumes a number and produces twice that number.
;Call your function double
;
; Recipe

; 1. Signature, purpose, and stub

;Number -> Number
;Produce 2 times the number given
; (define (double n) 0)

; 2.Examples (wrapped in check expect)
(check-expect (double 3) 6)

; 3. Inventory - templates and constants
; (define (double n)
;   (...n))

; 4. Code body using template

(define (double n)

  (* n 2))

; 5. Test and debug

;Function signatures declare the types of data the function consumes and produces
;The purpose is a one line description of what a function produces given what it consumes
;Stub is a skeleton of the function that acts as a stand in before we fill it in
;A stub must have the correct name, the correct number/type of arguments, and the produce the correct type of result.
;Examples are tests that will fail now, but pass once we finish the function
;When you run check-expect with a stub, the tests should run but fail

;String -> String
;Takes a string and adds s to the end
;(define (pluralize w) "words")
;(check-expect (pluralize "walnut") "walnuts")

;(define (pluralize w)
;  (string-append w "s"))


; Square example
; Signature: Number -> Number
; Purpose: Given the length of one side of a square, produce the area of a square
; Stub

;(define (area s) 0)
;(check-expect (area 3) 9)
;(check-expect (area 3.2) (* 3.2 3.2))

;Template

;(define (area s)
;  (...s))

;Code body using template
;(define (area s)
;  (* s s))

;Note - make sure tests are right, otherwise you may code a bad function

;Image Area example

;The Recipe is not a Waterfall process - you may have to go back and correct earlier steps

; Signature Image -> Natural
; Note: Natural is an integer. We want to be as specific about our function signature values as possible
; Produce images width * height (area)
; Function consumes an image and produces the area of the image
;(define (image-area img) 0);

;(check-expect (image-area (rectangle 2 3 "solid" "red")) 6)

;(define (image-area img)
;  (* (image-width img)(image-height img)))

; Tall Example

; Design is about going from a poorly-structured problem to a well-structured solution
; Function consumes an image and returns True if image is taller than it is wide

; Image -> Boolean

; Stub (define (tall? img) false)
(check-expect (tall? (rectangle 4 8 "solid" "red")) true)
(check-expect (tall? (rectangle 8 4 "solid" "red")) false)
(check-expect (tall? (rectangle 4 4 "solid" "red")) false)

; Skeleton
; (define (tall? img)
;   (...img))

(define (tall? img)
  (> (image-height img)(image-width img)))

; The above produces true if the predicate is true or false if the predicate is false
; Code coverage: Given tests, how much of my code is actually being evaluated? Tests should have complete code coverage.


