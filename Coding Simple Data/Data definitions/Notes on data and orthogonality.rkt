;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Notes on data and orthogonality|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; How to design a function that consumes non-primitive data (in our case, a city name)

; When designing functions that consume non-primitive data, we can borrow our function recipe
; with our data recipe

; Feel free to delete things from templates if new information arrives, or we can delete something we
; we do not need.

; Structure of data Orthogonality (the extent to which design methods work for almost any form of data)
; Orthogonal means "mostly independent." It does not depend on different forms of data

; Other types of data: distinct, interval, enumeration, itemization

; We will also have some compound data types

; Other structures include lists and trees

