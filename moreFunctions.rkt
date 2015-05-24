#lang racket

(define a '(q p r))
(define num '(5 6 4 8 9))
(define sqr-list '(1 2 3 4 5 6 7 8 9 10))

; function which return the second value
(define (secondValue lst)
  (if ( < (length lst) 2) "The list needs to have at least 2 values"
     (car (cdr lst))
 ))

;result
(secondValue a)        ;=>  'p
(secondValue num)      ;=>   6
(secondValue sqr-list) ;=>   2


; function which return a list of the squares of all odd integers in the list
(define (sqr_everySecondValue x)
  (sqr_val_helper x 1 '() ))

(define (sqr_val_helper x y list)
  (cond 
    [(null? x) list ]
    [(even? y) (sqr_val_helper (cdr x) (+ y 1) list)]
    [(reverse (sqr_val_helper (cdr x) (+ y 1) (cons (* (car x) (car x)) list)))]
  )
)

;result
(sqr_everySecondValue num)        ;=>  '(25 16 81)
(sqr_everySecondValue sqt-list)   ;=>  '(1 9 25 49 81)