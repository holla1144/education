;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ===== Local

(local [(define a 1)
        (define b 2)]
  (+ a b))

;; defintions are valid ONLY inside of the local

#;
(local [(define p "accio ")
        (define (fetch n) (string-append p n))]
  (fetch "portkey"))

;; values and functions defined in the global scope are called
;; Top Level

;; Structure of a local

;; (local [definition]
;;   expression)

(local [] (+ 1 1))
(local [(define b 2)]
  (+ 1 1))

;; (local [(define a 1)]) Expression required

#; 
(local [(define b 2)]
       [(define a 1)] ;; 1 set of brackets only
  (* a b))

;; ==== Lexical Scoping ====

;; Which value of p is used in fetch?

;; A: The local value, of course
;; Local overwrites global

(define p "incendio")

(local [(define p "accio ")
        (define (fetch n) (string-append p n))]
  (fetch "portkey"))

;; Definitions are sought from the inside out
;; When a variable is used in a function, we look
;; at the local scope to find a definition. If no
;; definition is found, we check the outer scope.

;; ==== A more complicated case ====

(define a 1)
(define b 2)
(+ a ;; 1
   (local [(define b 3)] ;; b is 3
     (+ a b)) ;; (+ 1 3) = 4
   b) ;; 2

;; (+ 1 4 2) 7


;; Evaluation rules for local expressions

(define l 1)

(+ l
   (local [(define l 2)]
     (* l l))
     l)

;; order of operations

;; 1. Start from the left, replacing the first l with 1

;; 2. Renaming, Lifting, Replacing
;; Every definition in the local is matched to references, and create a globally unique name for it.
;; l might become l_0, and references to l inside th local definition will be renamed accordingly
;; The renamed definition of l in the local scope is lifted/hoisted to the top level
;; The local body is replaced with a chunk of code the includes the renamed variable.

;; 3. The last reference to l is evaluated
























 