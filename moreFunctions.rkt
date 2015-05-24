#lang racket
(define a '(q p r))
(define num '(5 6 4 8 9))

(define (SecondValue lst)
  (if ( < (length lst) 2) "The list needs to have at least 2 values"
     (car (cdr lst))
     ))

(define (sqr_everySecondValue x)
  (sqr_val_helper x 1 '() ))

(define (sqr_val_helper x y list)
  (cond 
    [(null? x) list ]
    [(odd? y) (sqr_val_helper (cdr x) (+ y 1) (list))]
    [(sqr_val_helper (cdr x) (+ y 1) (cons (* (car x) (car x)) list))]
       )
    )