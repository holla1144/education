;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cond-expressions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We need a mechanism for handling if cases with more than two outcomes
; COND is a multi-armed conditional that can evaluate any number of cases

; #; blocks out an entire expression

;A cond contains cases, conceptualized below as question/answer pairs
;By convention, we use square brackets to fence off question/answer pairs
; In BSL, square brackets and parenthesis are equivalent

;(define (aspect-ratio img)
;  (cond [Q A]
;        [Q A]
;        [else A]))

;The last question/answer pair in a cond expression can be an 'else'
;The else expression will run if none of the earlier expressions return true

;Each question in a QA pair must evaluate to a boolean, with the exception of else.
