;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Notes on how we're going to use search to solve sodoku

;; First, we need to generate a tree to model a Sodoku board

;; For each empty spot on the Sudoku board, we generate all possible next
;; steps, and then prune the options to remove invalid boards.

;; The trees we're generating are "arbitrary arity trees", because
;; each board could have between one an nine next boards

;; We'll either come to a board that's full or run out of
;; valid options. If the former, we win. If the latter, we lose. 