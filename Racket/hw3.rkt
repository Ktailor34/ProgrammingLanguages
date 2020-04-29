#lang racket
(provide calcgrades)
(provide climbstairs)
(provide getdepth)

(define (sumList lst)
  (pickletter(round (/ (apply + lst) (length lst)))))

(define (pickletter value)
  (cond
    [(> value 89) "A"]
    [(> value 79) "B"]
    [(> value 69) "C"]
    [(> value 59) "D"]
    [(> value 49) "F"]))

(define (calcgrades lst)
  (map sumList lst))

;;;;;;;;;;;;;;;;;;;;;;;

;worked on with shivam patel

(define (helper l s)
  (if (< (length l) 3)
    s
    (if(< (car l) (car (cdr l)))
     (helper(cdr l) (+ s (car l)))
     (helper (cdr (cdr l)) (+ s (car (cdr l)))))))

(define (climbstairs lst) 
  (if (< (helper lst (car lst)) (helper (cdr lst) (car (cdr lst))))
      (helper lst (car lst))
      (helper (cdr lst) (car (cdr lst)))))

;;;;;;;;;;;;;;;;;;;;;;;;;

(define (checkValue lst x)
  (cond
    [(empty? lst) 0]
    [(= (car (flatten lst)) x) 1]
    [else(checkValue (cdr (flatten lst)) x)]))

(define (getLeftBranch tree)
  (cond
    [(empty? (cdr tree)) (cdr tree)]
    [else (car(cdr tree))]))

(define (getRightBranch tree)
  (cond
    [(empty? (cddr tree)) (cddr tree)]
    [else (car (cddr tree))]))

(define (compare tree k)
  (define left (checkValue (getLeftBranch tree) k))
  (define right (checkValue (getRightBranch tree) k))
  (if (> left right) 1 2))

(define (getdepth k tree)
  
  (define (getdepthHelper k tree count)
    (cond
      [(empty? tree) count]
      [(= (car (flatten tree)) k) count] 
      [(if (= 1 (compare tree k))
           (getdepthHelper k (getLeftBranch tree) (+ 1 count))
           (getdepthHelper k (getRightBranch tree) (+ 1 count)))]))
    
  (getdepthHelper k tree 0))




 





