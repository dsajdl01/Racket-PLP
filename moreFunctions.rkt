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

;function which return a list of the squares of all innteger in the list
(define (sqr-list x)
  (if (null? x) '()
      (cons (* (car x) (car x)) (sqr-list (cdr x)))))

:result
(sqr-list num)        ;=>  '(25 36 16 64 81)
(sqr-list sqt-list)   ;=>  '(1 4 9 16 25 36 49 64 81 100)

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

; function which give a position integer of N, and rerurns a list or sequence of the integers 1 through N, inclusive. 
(define (make-list x)
  (mk-helper x '()))
(define (mk-helper x y)
  (if (= 0 x) y
      (mk-helper (- x 1) (cons x y) )))

;result
(make-list 5)     ;=>  '(1 2 3 4 5)
(make-list 30)    ;=>  '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)

