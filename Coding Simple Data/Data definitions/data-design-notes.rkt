;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname data-design-notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Data Definition notes

; We can have complete function definitions
; that poorly document how a functino works, what data it consumes, and what that data simulates

; Problem Domain = a real world problem that needs to be solved
; Program Domain = data that needs to model things in the real world

; Data definitions begin with a declaration of type
; Ex. TLColor is one of:
;         - 0
;         - 1
;         - 2
; interp. color of a traffic light - 0 is red, 1 yellow, 2 green

; We can also create a template for working with TLColor
; Data definition tells us how to interpret information as data, and data as information
; Data definition restricts the types of data that can be produced or consumed

; HTDD = How To Design Data, a recipe

; How can we model the name of a city?
; Ex - Vancouver, Boston (these are examples of information)
; City name info is Atomic - it cannot be broken down into smaller, meaningful pieces

; CityName is String
; interp. the name of a city

; Examples

;(define CN "Boston")
;(define CN2 "Vancouver")

; Template

#;
(define (fn-for-city-name cn)
    (...cn))

; Templates rules used:
;  - Atomic non-distinct; String