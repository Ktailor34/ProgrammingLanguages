#lang racket

(define (hello x y)
  (* x y))

(define (add x)
  (+ 3 x))

(add 14)

(define (notequal? a b)
  (not equal? a b))

(define (countDown x)
  (println x)
  (if (= x 0)
      (println "TENNESSEE")
      (countDown (- x 1)))
)

(define (GBO a b c)
  (when (= a 10) (print "go"))
  (if (= b c) (if (> b a) "BIG" "ORANGE")  "!")
)

(define stuff (read))
(cond
  [(= stuff 0) "ZERO"]
  [(= stuff 1) "ONE"]
  [else "OTHER"])

(match stuff
  [0 "ZERO"]
  [1 "ONE"]
  [ELSE "OTHER"])

(when (= stuff 1)
  "ONE"
)

;car gives you first
;cdr gives you everything but first
;append exists
;cons 

(define c 10) 

(define b (list ))
(define (rng a b)
  
  (if (= a 10) 10 (rng (+ a 1)))
)
       
           