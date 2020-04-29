#lang racket
;Kishan Tailor
;HW1
;January 27th 2020
;RIP KOBE #824

;Problem 1: sum x to y
(define (sumxy x y)
  (define (sumxyHelper x y count)
    (if (> x y)
        count
        (sumxyHelper (+ x 1) y (+ count x)))
  )
  (define count 0)
  (sumxyHelper x y count)
)

;Problem 2 Mult numbers in list div by 5
(define (multeven l)
  (define (multevenHelp l sum)
    (if (empty? l)
        sum
        (if (equal? (remainder (car l) 5) 0)
            (multevenHelp (cdr l) (* sum (car l)))
            (multevenHelp (cdr l) sum)
        )))
   (define sum 1)
   (multevenHelp l sum)
        )

;Problem 3 Write a function that counts the freq of K in list
(define (countk l k)
  (define (countkHelp l k counter)
    (if (empty? l)
        counter
        (if (= (car l) k) 
            (countkHelp(cdr l) k (+ counter 1))
            (countkHelp(cdr l) k counter))))
  (define counter 0)
  (countkHelp l k counter)
)

;Problem 4 Write a function that returns a list of the even
; numbers from 0 t K Assume k is positive
(define (evens k)
  (filter even? (range 0 (+ k 1))))