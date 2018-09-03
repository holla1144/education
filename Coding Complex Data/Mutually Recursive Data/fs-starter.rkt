;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname fs-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Arbitrary arity trees

;; A good example of how this might work is a file system
;; A folder can have an arbitrary depth
;; For the purposes of this lesson, we won't worry too much about the contents of a folder

;; Each element can have sub-elements
;; each element can also just have data (let's say a single integer)

;; These structures are arbitrarily deep and arbitrarily wide (two dimensions)

;; This will require two cycles in the type-reference graph

;; fs-starter.rkt (type comments and examples)

;; Self-Reference vs. Mutual Reference

;; Self-reference is about breadth. It allows each element to have an arbitrary amount of elements within it

;; Mutual-reference as about depth. It allows each element element to be as deep as necessary

;; Reference - something that is neither self, nor mutual reference
;; Data definitions:

;; NMR - Natural Mutual Recursion. This seems to occur when there is mutual reference

;; NR - Natural Recursion. This seems to occur when there is self reference in a template

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.

;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2))) ;; has two files, F1 and F2
(define D5 (make-elt "D5" 0 (list F3)))    ;; has one files, F3
(define D6 (make-elt "D6" 0 (list D4 D5))) ;; has two directories, D4 and D5

(define (fn-for-element e)
  (... (elt-name e)                      ;; String
       (elt-data e)                      ;; Integer
       (fn-for-loe (elt-subs e))))       ;; List of Element (we wrap this with fn-for-loe because it is non-primitive data)

(define (fn-for-loe loe)
  (cond [(empty? loe)(...)]
        [else
         (...(fn-for-element (first loe))
             (fn-for-element (rest loe)))]))

;; Functions:





;; Functions:

