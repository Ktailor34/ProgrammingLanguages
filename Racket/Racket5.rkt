#lang racket

(define (dostuff lst)
  (map (lambda(x) (if (> x 10) (* x 3.14) x )) lst))

(dostuff '(1 4 11))

(define (getelement lst x)
  (if (= x 0) (car lst) (getelement (cdr lst) (- x 1))))

;folding foldl foldr

(foldl - 100 '(1 2 3 4))

(require graphics/turtles)
(turtles #t)

(define (loop i n)
  (draw 2)
  (turn 1)
  (if (>= i n) #t
      (loop (add1 i) n)))


(define (blah a x t)
  (draw (* a 10))
  (turn (+ x 100))
  (if (< t 0) ""
      (blah (+ a 20) x (- t 1))))

(blah 100 100 100000)