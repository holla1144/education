;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; There's a shorter way to make lists than just
;; consing things together

(cons "a" (cons "b" (cons "c" empty)))

(list "a" "b" "c")

;; The two lists above are identical!

;; We can add elements to lists using cons,
;; access elements using first and rest

(list (+ 1 2)(+ 3 4)(+ 5 6))

(define L1 (list "b" "c"))
(define L2 (list "d" "e" "f"))

(cons "a" L1) ;; Will add a to the front of L1

(append L1 L2) ;; combine two lists

;; How to look up items in a list

(define-struct account (number name))

(list (make-account 1 "abc") (make-account 4 "dcj") (make-account 3 "ilk"))

;; Binary Search Tree

;; One way to look up a member in a list is with a loop
;; But what if the list is thousands and thousands of elements long?

;; The way to denote an arbitrary size is "n"

;; On average, we'll have to work through "n/2" of the account
;; to find the account we're actually looking for.

;; Ideas to make this more efficient
;; -- Sort the list numerically (doesn't help, because lists can only be traveresed with first and rest)
;; -- Use a Binary search tree

;; At every node, all the nodes in the left sub-tree have
;; a value less than the center, and all the nodes in the right
;; sub-tree have a value greater than the center

;; The above rule is "INVARIANT" - it is true for the entire tree

;; Efficiency of the binary search tree is log(n) because
;; the number of nodes we need to look at is 50% smaller on
;; each pass