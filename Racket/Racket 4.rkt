#lang racket

(define (domath)
  (let ([x 10]
        [y 20]
        [z 30])
    ;body within scope
    (print x)
    (print y)))

(define (domath1)
  (let* ([x 10]
         [y (* x 2)])
  (print y)))

;lambda function
(define (doadd x y) (+ x y))

((lambda (x y) (+ x y)) 1 2)

(define (square x)
  (* x x))
(map square '(1 2 3 4 5))

(map (lambda (x) (* x x))
     '(1 2 3 4 5 6 7))


