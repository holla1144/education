;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; A space invaders game!

;; Constants:

(define WIDTH  600)
(define HEIGHT 800)

;; IMGs

(define SHIP-IMG (overlay/align "middle" "bottom"
                                (ellipse 30 15 "solid" "blue")
                                (ellipse 20 20 "solid" "blue")))

(define BULLET-IMG (ellipse 10 20 "solid" "red"))

(define BASE-IMG (overlay/align "middle" "bottom"
                                (rectangle 30 10 "solid" "green")
                                (rectangle 10 20 "solid" "black")))

(define BULLET-SPEED 4)

(define BASE-Y (- HEIGHT (/ (image-height BASE-IMG) 2)))

(define BULLET-Y-START (- HEIGHT (image-height BASE-IMG)))
(define SHIP-H-SPEED 4)
(define SHIP-V-SPEED 2)

(define MTS (empty-scene WIDTH HEIGHT))


;; Data definitions:

;; ==== Bullet ===

(define-struct bullet (x y))

;; Bullet is a compound data structure
;; Bullet is a (make-bullet Natural Natural)
;; interp. x coordinate of bullet[(image-height BASE-IMG), WIDTH] and Y[0, HEIGHT] coordinate of bullet (in screen coordinates)

(define bullet1 (make-bullet WIDTH 40)) ;; bullet at outer edge of game area
(define bullet2 (make-bullet (/ WIDTH 2) (/ HEIGHT 2))) ;; bullet in the middle of the game area
(define bullet3 (make-bullet 0 20)) ;; bullet at the leftmost ege of the game area

#;
(define (fn-for-bullet b)
  (...(bullet-x b)
      (bullet-y b)))

;; ==== List of Bullet ===

;; ListOfBullet is one of
;; - empty
;; (cons bullet ListOfBullet)

(define lob1 empty)
(define lob2 (cons (make-bullet 1 200) empty))
(define lob3 (cons (make-bullet 200 400) (cons (make-bullet 1 200) empty)))


;; Template rules
;;  - compound data
;;  - natural recursion from self-reference
;;  - mutual recursion from mutual-reference

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) ...]
        [else
         (... (fn-for-bullet (first lob))  ;mutual recursion from mutual-reference
              (fn-for-lob (rest lob)))]))  ;natural recursion from self-reference



;; ==== Ship ===

;; Ship is a (make-ship Natural Natural Number)
;; Interp. Makes a ship with an x coordinate Number[0, WIDTH] and a Y coordina Number[0, HEIGHT], and speed Number which indicates whether the ship is moving to the left or to the right

(define-struct ship (x y s))

(define ship1 (make-ship WIDTH 40 SHIP-H-SPEED)) ;; ship at outer edge of game area
(define ship2 (make-ship (/ WIDTH 2) (/ HEIGHT 2) SHIP-H-SPEED)) ;; ship in the middle of the game area
(define ship3 (make-ship 0 20 SHIP-H-SPEED)) ;; ship at the leftmost ege of the game area
(define ship4 (make-ship 300 300 (- SHIP-H-SPEED)))

#;
(define (fn-for-ship ship)
  (...(ship-x ship)
      (ship-y ship)
      (ship-s ship)))

;; ==== List of Ship ====

;; ListOfShip is one of:
;;  - empty
;;  - (cons ship ListOfShip)


(define los1 empty)
(define los2 (cons (make-ship 3 4 SHIP-H-SPEED) empty))
(define los3 (cons (make-ship 300 400 SHIP-H-SPEED) (cons (make-ship 3 4 ( - SHIP-H-SPEED)) empty)))

;; Template rules
;;  - compound data
;;  - natural recursion from self-reference
;;  - mutual recursion from mutual-reference

#;
(define (fn-for-los los)
  (cond [(empty? los) ...]
        [else
         (... (fn-for-ship (first los))  ;mutual recursion from mutual-reference
              (fn-for-los (rest los)))]))  ;natural recursion from self-reference

;; ==== Base ====

(define-struct base (x y))
;; Base is an (make-base Natural Natural)
;; Interp. base is make-base with an x coordate Natural[0, WIDTH] and a y coordinate Natural 0

(define base1 (make-base 100 BASE-Y))
(define base2 (make-base 0 BASE-Y))
(define base3 (make-base WIDTH BASE-Y))

#;
(define (fn-for-base base)
  (...(base-x base)
      (base-y base)))

;; === GameState ===

(define-struct gs (los lob base counter))

;; GameState is (make-gs ListOfShips ListOfBullets Base)

(define gs1 (make-gs empty empty (make-base 100 BASE-Y) 0))
(define gs2 (make-gs (cons (make-ship 300 400 SHIP-H-SPEED) (cons (make-ship 3 4 ( - SHIP-H-SPEED)) empty))
                     empty
                     (make-base WIDTH BASE-Y)
                     0))

#;
(define (fn-for-gameState gs)
  (...(gs-los gs)
      (gs-lob gs)
      (gs-base gs)
      (gs-counter gs)))

;; Functions:

;; ==== Main ====
;; GameState -> GameState
;; start the world with initial state c, for example:


#;
(main (make-gs
       (cons (make-ship 300 400 SHIP-H-SPEED) (cons (make-ship 3 4 ( - SHIP-H-SPEED)) empty))
       empty (make-base WIDTH BASE-Y)
       0))

(define (main gs)
  (big-bang gs                        ; GameState
    (on-tick   tock)                  ; GameState -> GameState
    (to-draw   render)                ; GameState -> Image
    (on-mouse  handle-mouse)))             



;; ==== Tock ====
;; GameState -> GameState
;; Takes a gameState and produces a new gamestate

(check-expect (tock (make-gs empty empty (make-base 100 BASE-Y) 0))
              (make-gs empty empty (make-base 100 BASE-Y) 1))

(check-expect (tock (make-gs (cons (make-ship 0 0 SHIP-H-SPEED) empty) empty (make-base 200 BASE-Y) 1))
              (make-gs (cons (next-ship (make-ship 0 0 SHIP-H-SPEED)) empty) empty (make-base 200 BASE-Y) 2))

(check-expect (tock (make-gs (cons (make-ship 0 0 SHIP-H-SPEED) empty) empty (make-base 200 BASE-Y) 45))
              (make-gs (cons (make-ship 0 0 SHIP-H-SPEED) (cons (next-ship (make-ship 0 0 SHIP-H-SPEED)) empty))
                       empty
                       (make-base 200 BASE-Y)
                       46))



(define (tock gs)
  (if (and (> (gs-counter gs) 1)(= 0 (modulo (gs-counter gs) 45)))
      (make-gs
       (cons (make-ship 0 0 SHIP-H-SPEED) (next-ships (filter-ships (gs-los gs) (gs-lob gs))))
       (next-bullets (filter-bullets (gs-lob gs)(gs-los gs)))
       (make-base (base-x (gs-base gs))(base-y (gs-base gs))) 
       (+ 1 (gs-counter gs)))
      (make-gs
       (next-ships (filter-ships (gs-los gs) (gs-lob gs)))
       (next-bullets (filter-bullets (gs-lob gs)(gs-los gs)))
       (make-base (base-x (gs-base gs))(base-y (gs-base gs))) 
       (+ 1 (gs-counter gs))))) ;; Stub



;; ==== Filter Bullets ====

;; ListOfBullets ListOfShips -> ListOf Bullets
;; Remove Bullets that intersect with ships

(check-expect (filter-bullets (cons (make-bullet 100 200) empty) empty) (cons (make-bullet 100 200) empty))
(check-expect (filter-bullets (cons (make-bullet 100 200) empty) (cons (make-ship 100 200 SHIP-H-SPEED) empty)) empty)
(check-expect (filter-bullets (cons (make-bullet 0 0) (cons (make-bullet 100 200) empty))
                              (cons (make-ship 100 200 SHIP-H-SPEED) empty)) (cons (make-bullet 0 0) empty))
(check-expect (filter-bullets (cons (make-bullet 0 0) (cons (make-bullet 100 200) empty)) (cons (make-ship 400 400 SHIP-H-SPEED) empty)) (cons (make-bullet 0 0) (cons (make-bullet 100 200) empty)))

;; (define (filter-bullets lob los) empty)

(define (filter-bullets lob los)
  (cond [(empty? lob) empty]
        [else
         (if (bullet-collides? (first lob) los)
             (filter-bullets (rest lob) los)
             (cons (first lob) (filter-bullets (rest lob) los)))]))


;; ==== Bullet Collides ====

(define (bullet-collides? bullet los)
  (cond [(empty? los) false]
        [else
         (or (collide? (first los) bullet)
             (bullet-collides? bullet (rest los)))]))

;; ==== Filter Ships ====

;; ListOfShips ListOfBullets -> ListOfShips
;; Remove ships from the ListOfShips that intersect with bullets

(check-expect (filter-ships (cons (make-ship 100 200 SHIP-H-SPEED) empty) empty) (cons (make-ship 100 200 SHIP-H-SPEED) empty))        ;; no collision
(check-expect (filter-ships (cons (make-ship 100 200 SHIP-H-SPEED) empty) (cons (make-bullet 100 200) empty)) empty)                   ;; one collision
(check-expect (filter-ships (cons (make-ship 100 200 SHIP-H-SPEED) empty)
                            (cons (make-bullet 0 0) (cons (make-bullet 100 200) empty))) empty)                                        ;; Collision but not first bullet

(check-expect (filter-ships (cons (make-ship 0 0 SHIP-H-SPEED) (cons (make-ship 100 200 SHIP-H-SPEED) empty))
                            (cons (make-bullet 0 0) (cons (make-bullet 100 200) empty))) empty)    ;; Collision but not first ship and not first bullet

;; (define (filter-ships los lob) empty) STUB

(define (filter-ships los lob)
  (cond [(empty? los) empty]
        [else
         (if (ship-collides? (first los) lob)
             (filter-ships (rest los) lob)
             (cons (first los) (filter-ships (rest los) lob)))]))


;; ==== Ship collides? ====
;; Ship ListOfBullets -> Bool
;; Consumes a ship and a list of bullets and returns true if the ship collides with one of the bullets

(check-expect (ship-collides? (make-ship 100 200 SHIP-H-SPEED) (cons (make-bullet 0 0) empty)) false)

(check-expect (ship-collides? (make-ship 100 200 SHIP-H-SPEED) (cons (make-bullet 100 200) empty)) true)

(check-expect (ship-collides? (make-ship 100 200 SHIP-H-SPEED)
                              (cons (make-bullet 0 0) (cons (make-bullet 100 200) empty))) true)

;; (define (ship-collides? ship lob) false) ;; STUB

(define (ship-collides? ship lob)
  (cond [(empty? lob) false]
        [else
         (or (collide? ship (first lob))
             (ship-collides? ship (rest lob)))]))

;; ==== Images Collide ====
;; Ship Bullet -> Bool
;; Returns true if the two images intersect

;; Note: Intersection in this case means the following

;; The Y coordinate of the first Image is greater than or equal to the Y coordinate of the second image
;; The Left X of the first image is between the Left X and Right X of the second image
;; Or The Right X of the first image is between the Left X and Right X of the second image

(check-expect (collide? (make-ship 100 200 SHIP-H-SPEED) (make-bullet 20 40) ) false)   ;images don't collide
(check-expect (collide? (make-ship 100 200 SHIP-H-SPEED) (make-bullet 100 200)) true)   ;images collide dead center (20px difference accounts for image height from center
(check-expect (collide? (make-ship 120 180 SHIP-H-SPEED) (make-bullet 100 200)) true)   ;images collide bullet hits ship left - just barely
(check-expect (collide? (make-ship 121 180 SHIP-H-SPEED) (make-bullet 100 200)) false)  ;images don't collide on the ship left - just barely
(check-expect (collide? (make-ship 100 180 SHIP-H-SPEED) (make-bullet 120 200)) true)   ;images collide on ship right
(check-expect (collide? (make-ship 100 200 SHIP-H-SPEED) (make-bullet 121 200) ) false) ;images don't collide on the ship's right - just barely

;;(define (collide? img1 img2) false) STUB
(define TESTSHIP (make-ship 120 180 SHIP-H-SPEED))
(define TESTBUL (make-bullet 100 200))

(define (collide? ship bul)
  (and (and (<= (- (bullet-y bul)(/ (image-height BULLET-IMG) 2)) (+ (ship-y ship)(/ (image-height SHIP-IMG) 2)))
            (>= (+ (bullet-y bul)(/ (image-height BULLET-IMG) 2))  (- (ship-y ship)(/ (image-height SHIP-IMG) 2))))
       (or (and (>= (+ (bullet-x bul)(/ (image-width BULLET-IMG) 2))(- (ship-x ship)(/ (image-width SHIP-IMG) 2)))
                (<= (+ (bullet-x bul)(/ (image-width BULLET-IMG) 2))(+ (ship-x ship)(/ (image-width SHIP-IMG) 2))))
           (and (>= (- (bullet-x bul)(/ (image-width BULLET-IMG) 2))(- (ship-x ship)(/ (image-width SHIP-IMG) 2)))
                (<= (- (bullet-x bul)(/ (image-width BULLET-IMG) 2))(+ (ship-x ship)(/ (image-width SHIP-IMG) 2)))))))

;; ==== Handle Mouse ====

;; gameState X Y MouseEvent -> gameState
;; interp. One mouse move, generate a new gameState with an updated base x coordinate. On click, add a bullet to the list of bullets

(check-expect (handle-mouse (make-gs empty empty (make-base 0 BASE-Y) 0) 10 0 "move")
              (make-gs empty empty (make-base 10 BASE-Y) 0))

(check-expect (handle-mouse (make-gs empty empty (make-base 0 BASE-Y) 0) 10 0 "drag")
              (make-gs empty empty (make-base 0 BASE-Y) 0))

(check-expect (handle-mouse (make-gs empty empty (make-base 0 BASE-Y) 0) 300 400 "move")
              (make-gs empty empty (make-base 300 BASE-Y) 0))

(check-expect (handle-mouse (make-gs empty empty (make-base 300 BASE-Y) 0) 300 400 "button-down")
              (make-gs empty (cons (make-bullet 300 BULLET-Y-START) empty) (make-base 300 BASE-Y) 0))

(check-expect (handle-mouse (make-gs empty (cons (make-bullet 300 BULLET-Y-START) empty) (make-base 0 BASE-Y) 0) 0 0 "button-down")
              (make-gs empty (cons (make-bullet 0 BULLET-Y-START) (cons (make-bullet 300 BULLET-Y-START) empty)) (make-base 0 BASE-Y) 0))

;; (define (handle-mouse-move ws x y me) (make-gs empty empty (make-base 0 BASE-Y))) STUB
  
(define (handle-mouse gs x y me)
  (cond [(mouse=? me "move")(make-gs (gs-los gs)(gs-lob gs)(make-base x BASE-Y)(gs-counter gs))]
        [(mouse=? me "button-down")
         (make-gs (gs-los gs)
                  (cons (make-bullet (base-x (gs-base gs)) BULLET-Y-START)(gs-lob gs))
                  (gs-base gs)
                  (gs-counter gs))]
        [else gs]))

;; ==== Next Ship ====
;; Ship -> Ship
;; Take a Ship and produces the next ship to be produced on tick

(check-expect (next-ship (make-ship 0 0 SHIP-H-SPEED)) (make-ship SHIP-H-SPEED SHIP-V-SPEED SHIP-H-SPEED))                             ;; Ship starts at 0, 0
(check-expect (next-ship (make-ship 200 200 SHIP-H-SPEED)) (make-ship (+ SHIP-H-SPEED 200) (+ SHIP-V-SPEED 200) SHIP-H-SPEED))         ;; Ship starts at 0, 0
(check-expect (next-ship (make-ship WIDTH 200 SHIP-H-SPEED)) (make-ship (- WIDTH SHIP-H-SPEED) (+ SHIP-V-SPEED 200) (- SHIP-H-SPEED))) ;; Ship at rightmost edge
(check-expect (next-ship (make-ship 0 200 (- SHIP-H-SPEED))) (make-ship SHIP-H-SPEED (+ SHIP-V-SPEED 200) SHIP-H-SPEED))               ;; Ship at leftmost edge

;; (define (next-ship ship)(make-ship 0 0 SHIP-H-SPEED)) STUB

;; Use template for ship

(define (next-ship ship)
  (cond [(> (+ (ship-x ship) (ship-s ship)) WIDTH)
         (make-ship (+ (ship-x ship)(- (ship-s ship))) (+ (ship-y ship) SHIP-V-SPEED)(- (ship-s ship)))]
        [(> 0 (+ (ship-x ship) (ship-s ship)))
         (make-ship (+ (ship-x ship)(- (ship-s ship))) (+ (ship-y ship) SHIP-V-SPEED)(- (ship-s ship)))]
        [else (make-ship (+ (ship-x ship)(ship-s ship)) (+ (ship-y ship) SHIP-V-SPEED)(ship-s ship))]))

;; === Next Ships

;; ListOfShips -> ListOfShips
;; Consumes list of ships and produces a list of ships with each ship advanced one tick (removes ship if ship is off the screen)
;; !!! Add functionality to have ship removed if it is intersecting with a bullet

(check-expect (next-ships empty) empty)

(check-expect (next-ships (cons (make-ship 200 200 SHIP-H-SPEED) empty))
              (cons (next-ship (make-ship 200 200 SHIP-H-SPEED)) empty))

(check-expect (next-ships
               (cons (make-ship 0 0 SHIP-H-SPEED)
                     (cons (make-ship 200 200 SHIP-H-SPEED) empty)))
              (cons (next-ship (make-ship 0 0 SHIP-H-SPEED))
                    (cons (next-ship (make-ship 200 200 SHIP-H-SPEED)) empty)))

(check-expect (next-ships (cons (make-ship 100 (+ HEIGHT 1) SHIP-H-SPEED) empty)) empty) ;; Remove ships that are off screen (Y coordinate greater than HEIGHT) 

;; (define (next-ships ship) empty) STUB

;; Use template from los

(define (next-ships los)
  (cond [(empty? los) empty]
        [(> (ship-y (first los)) HEIGHT)
         (next-ships (rest los))]
        [else
         (cons (next-ship (first los))  
               (next-ships (rest los)))]))

;; === Next Bullet ====

;; Bullet -> Bullet
;; Consumes a Bullet and produces a Bullet advanced by one tick

(check-expect (next-bullet (make-bullet 300 300)) (make-bullet 300 (- 300 BULLET-SPEED)))     ;; Bullet in flight

(check-expect (next-bullet (make-bullet 0 (- HEIGHT (image-height BASE-IMG))))                ;; Bullet just launched
              (make-bullet 0 (- HEIGHT (image-height BASE-IMG) BULLET-SPEED)))

;; (define (next-bullet bullet) (make-bullet 0 (image-height BASE-IMG)))

;; Use template for bullet

(define (next-bullet b)
  (make-bullet (bullet-x b) (- (bullet-y b) BULLET-SPEED)))

;; ==== Next Bullets ====
;; LOB -> LOB
;; Consumes a list of bullets and returns a new list of bullets with each member advanced one tick (bullets removed from list of their Y coordinate is less than 0)

(check-expect (next-bullets empty) empty)

(check-expect (next-bullets (cons (make-bullet 100 -1) empty)) empty) ;; Remove bullet that has gone off screen

(check-expect (next-bullets (cons (make-bullet 100 100) (cons (make-bullet 400 400) empty)))
              (cons (next-bullet (make-bullet 100 100)) (cons (next-bullet (make-bullet 400 400)) empty)))


;; (define (next-bullets lob) empty) STUB

;; Use template from ListOfBullets

(define (next-bullets lob)
  (cond [(empty? lob) empty]
        [(> 0 (bullet-y (first lob)))
         (next-bullets (rest lob))]
        [else
         (cons (next-bullet (first lob))  
               (next-bullets (rest lob)))]))

;; GameState -> Image
;; produce image with GameState

(check-expect (render (make-gs empty empty (make-base 100 BASE-Y) 0))
              (place-image BASE-IMG 100 BASE-Y MTS))

(check-expect (render (make-gs empty (cons (make-bullet 100 100) empty) (make-base 200 BASE-Y) 0))
              (place-image BULLET-IMG 100 100 (place-image BASE-IMG 200 BASE-Y MTS)))

(check-expect (render (make-gs empty (cons (make-bullet 200 10) (cons (make-bullet 100 100) empty)) (make-base 200 BASE-Y) 0))
              (place-image BULLET-IMG 200 10 (place-image BULLET-IMG 100 100 (place-image BASE-IMG 200 BASE-Y MTS))))

(check-expect (render (make-gs (cons (make-ship 300 300 SHIP-H-SPEED) empty) (cons (make-bullet 200 10) (cons (make-bullet 100 100) empty)) (make-base 200 BASE-Y) 0))
              (place-image SHIP-IMG 300 300 (place-image BULLET-IMG 200 10 (place-image BULLET-IMG 100 100 (place-image BASE-IMG 200 BASE-Y MTS)))))

(check-expect (render (make-gs (cons (make-ship 100 600 SHIP-H-SPEED) (cons (make-ship 300 300 SHIP-H-SPEED) empty)) (cons (make-bullet 200 10) (cons (make-bullet 100 100) empty)) (make-base 200 BASE-Y) 0))
              (place-image SHIP-IMG 100 600 (place-image SHIP-IMG 300 300 (place-image BULLET-IMG 200 10 (place-image BULLET-IMG 100 100 (place-image BASE-IMG 200 BASE-Y MTS))))))
 
(define (render gs)
  (place-ships (gs-los gs)
               (place-bullets (gs-lob gs)
                              (place-image BASE-IMG (base-x (gs-base gs))(base-y (gs-base gs))MTS))))


;; ==== Place Ships ====

;; ListOfShip BackgroundImage -> Image
;; Consumes a list of ships and then renders them on a background image

(check-expect (place-ships empty MTS) MTS)

(check-expect (place-ships (cons (make-ship 3 4 SHIP-H-SPEED) empty) MTS)
              (place-image
               SHIP-IMG 3 4 MTS))

(check-expect (place-ships (cons (make-ship 300 400 SHIP-H-SPEED) (cons (make-ship 3 4 ( - SHIP-H-SPEED)) empty)) MTS)
              (place-image
               SHIP-IMG 300 400
               (place-image SHIP-IMG 3 4 MTS)))

;; (define (place-ships los MTS) MTS) STUB

(define (place-ships los bg-image)
  (if (empty? los)
      bg-image
      (place-image SHIP-IMG
                   (ship-x (first los))
                   (ship-y (first los))
                   (place-ships (rest los) bg-image))))


;; ==== Place Bullets ====

;; ListOfBullets BackgroundImage -> Image
;; Consumes a list of Bullets and then renders them on a background image

(check-expect (place-bullets empty MTS) MTS)

(check-expect (place-bullets (cons (make-bullet (/ WIDTH 2) (/ HEIGHT 2)) empty) MTS)
              (place-image
               BULLET-IMG (/ WIDTH 2) (/ HEIGHT 2) MTS))

(check-expect (place-bullets (cons (make-bullet 200 400) (cons (make-bullet (/ WIDTH 2) (/ HEIGHT 2)) empty)) MTS)
              (place-image
               BULLET-IMG 200 400
               (place-image BULLET-IMG (/ WIDTH 2) (/ HEIGHT 2) MTS)))

;; (define (place-bullets lob MTS) MTS) ;; STUB


(define (place-bullets lob bg-image)
  (if (empty? lob)
      bg-image
      (place-image BULLET-IMG
                   (bullet-x (first lob))
                   (bullet-y (first lob))
                   (place-bullets (rest lob) bg-image))))
