#lang racket


(define (addxtoy x y)
  (define (addxtoyHelp x y)
    (range x (+ y 1)))
  (apply + (addxtoyHelp x y)))


(define (triple lst)
  (define (myFunc x)
    (* x 3))
  (map myFunc lst))

(define (positives lst)
  (define (myFunc x)
    (if (> x 0) x 1))
  (apply * (map myFunc lst)))

(define (calculateF value)
  (cond
    [(= value 1) 1]
    [(= value 2) 2]
    [(= value 3) 3]
    [else (* (calculateF (- value 1)) (calculateF (- value 3)))]))




(define (countLetters givenL findL)
  (map (lambda (n) (countChars n givenL 0)) findL)
)

(define (countChars x lst count)
  (if (empty? lst)
      count
      (if (= (car lst) x)
          (countChars x (cdr lst) (+ count 1))
          (countChars x (cdr lst) count))))

(countLetters '(0 0 0 1) '(0 1 2))

