#lang racket


(define (hundred x)
  (define (hundred-helper lst i)
    (if (< i 10)
        (cons x (hundred-helper lst (add1 i)))
        lst))
  (hundred-helper '() 0))

(define (ran x)
  (if (> x 1)
      (append (ran (sub1 x)) (list x))
      (list x)))

(define x 1)              
(define (len1 lst)
  (+ x 1)
  (if (empty? lst) (+ x 1) (len1(cdr lst)))
)

(define (len l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (len (cdr l)))]))

(len1 '(0 1 2 3 4 5 6 7))

;flatten
;range (10)
;range (1 10)
;range (1 10 .05)
;apply + '(1 2 3) apply makes list unpack
;map sub1 '(1 2 3)
;filter?