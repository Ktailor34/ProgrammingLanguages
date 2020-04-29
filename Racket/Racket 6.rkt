#lang racket

(define (triplesum lst)
  (foldl (lambda (val result)
           (+ result (* val 3)))
         0
         lst))

(triplesum '(1 1 1))

(define (doubler)
  (lambda (x) (* x x)))

((doubler) 10)