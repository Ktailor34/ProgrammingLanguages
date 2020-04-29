#lang racket
(provide tet)
(provide knoxsort)
(provide turtle)
; Kishan Tailor
; HW 2
; Worked with Shivam Patel

(define (turtle lst) ; lst is a list. return value is a list of length 2.
  (define(forwardFunction a pair)
    (define x (car pair))
    (define y (cdr pair))
    (cond
      [(equal? 1 a) (cons (+ x 1) y)]
      [(equal? 2 a) (cons x (- y 1))]
      [(equal? 3 a) (cons (- x 1) y)]
      [(equal? 0 a) (cons x (+ y 1))])
    )
  (define(backwardFunction a pair)
    (define x (car pair))
    (define y (cdr pair))
    (cond
      [(equal? 1 a) (cons (- x 1) y)]
      [(equal? 2 a) (cons x (+ y 1))]
      [(equal? 3 a) (cons (+ x 1) y)]
      [(equal? 0 a) (cons x (- y 1))])
    )
  (define(leftFunction a)
    (if (= a 0) 3 (- a 1)))
  (define(rightFunction a)
    (if (= a 3) 0 (+ a 1)))
  (define(turtleHelper lst modVal pair)  
    (if (empty? lst)
        (list (car pair) (cdr pair))
        (cond
          [(equal? "left" (car lst)) (turtleHelper (cdr lst) (leftFunction modVal) pair)]
          [(equal? "right" (car lst)) (turtleHelper (cdr lst) (rightFunction modVal) pair)]
          [(equal? "forward" (car lst)) (turtleHelper (cdr lst) modVal (forwardFunction modVal pair))] 
          [(equal? "backward" (car lst)) (turtleHelper (cdr lst) modVal (backwardFunction modVal pair))])))

  (turtleHelper lst 0 (cons 0 0))
)

(define (tet n) ; n is a positive integer. return value is a list.
  (define (tetHelp n)
  (cond
    [(= n 1) 0]
    [(= n 2) 0]
    [(= n 3) 0]
    [(= n 4) 1]
    [else  (+ (tetHelp (- n 1)) (tetHelp (- n 2)) (tetHelp (- n 3)) (tetHelp (- n 4)))]))
  
  (cond
    [(= n 0) '()]
    [(= n 1) '(0)]
    [(= n 2) '(0 0)]
    [(= n 3) '(0 0 0)]
    [(= n 4) '(0 0 0 1)]
    [else (append (tet (sub1 n))
                (list
                (+ (tetHelp(- n 1))
                   (tetHelp(- n 2))
                   (tetHelp(- n 3))
                   (tetHelp(- n 4)))))]))


(define (knoxsort lst) ;lst is a list of integers. return value is a list.
    
  (define (sortHelper n lst)
  (cond
    [(empty? lst) (cons n '())]
    [(< n (car lst)) (cons n lst)]
    [else (cons (car lst) (sortHelper n (cdr lst)))]))

  (cond
    [(empty? lst) '()]
    [else (sortHelper (car lst) (knoxsort (cdr lst)))]))




