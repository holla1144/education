;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;(circle 10 "solid" "red")
;(rectangle 30 60 "outline" "blue")
;(text "hello" 24 "orange")

;(above (circle 10 "solid" "red")
;      (circle 20 "solid" "yellow")
;       (circle 30 "solid" "green"))

;(beside (circle 10 "solid" "red")
;      (circle 20 "solid" "yellow")
;      (circle 30 "solid" "green"))

;(overlay (circle 10 "solid" "red")
;      (circle 20 "solid" "yellow")
;      (circle 30 "solid" "green"))

(overlay (ellipse 100 150 "outline" "peach")
         (above (beside (overlay (ellipse 20 12 "outline" "black")(circle 4 "solid" "brown"))
                 (text "blank" 7 "transparent")
                 (overlay (ellipse 20 12 "outline" "black")(circle 4 "solid" "brown")))
                (beside (text "blan" 7 "transparent")(right-triangle 17 30 "solid" "brown"))
                (text "blank" 15   "transparent")
                (add-line (ellipse 30 15 "solid" "red") 5 7.5 25 7.5 "black")
                )
         )