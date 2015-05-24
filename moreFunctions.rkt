#lang racket

(require htdp/testing)
(require racket/trace)

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

(define (secVal nm)
  ((lambda (n) n) (car (cdr nm))))

:result
(secVal a)            ;=> 'p
(secVal num)          ;=>  6

;function which return a list of the squares of all innteger in the list
(define (sqr-list x)
  (if (null? x) '()
      (cons (* (car x) (car x)) (sqr-list (cdr x)))))

:result
(sqr-list num)        ;=>  '(25 36 16 64 81)
(sqr-list sqt-list)   ;=>  '(1 4 9 16 25 36 49 64 81 100)


; function which return a list of the squares of all odd integers in the list

(check-expect (sqr_everySecondValue num) '(25 16 81))
(define (sqr_everySecondValue x)
  (sqr_val_helper x 1 '() ))

(define (sqr_val_helper x y list)
  (cond 
    [(null? x) list ]
    [(even? y) (sqr_val_helper (cdr x) (+ y 1) list)]
    [(reverse (sqr_val_helper (cdr x) (+ y 1) (cons (* (car x) (car x)) list)))]
  )
)

(trace sqr_val_helper)
(generate-report)

;tracing result
>    (sqr_val_helper '(5 6 4 8 9) 1 '())
>    (sqr_val_helper '(6 4 8 9) 2 '(25))
>    (sqr_val_helper '(4 8 9) 3 '(25))
> >    (sqr_val_helper '(8 9) 4 '(16 25))
> >    (sqr_val_helper '(9) 5 '(16 25))
> >    (sqr_val_helper '() 6 '(81 16 25))
< <  '(81 16 25)
< <  '(25 16 81)
<   '(81 16 25)
<   '(25 16 81)
; The test passed!

;result
(sqr_everySecondValue num)        ;=>  '(25 16 81)
(sqr_everySecondValue sqt-list)   ;=>  '(1 9 25 49 81)

; function which give a position integer of N, and rerurns a list or sequence of the integers 1 through N, inclusive. 

(check-expect (make-list 10) '(1 2 3 4 5 6 7 8 9 10))

(define (make-list x)
  (mk-helper x '()))
(define (mk-helper x y)
  (if (= 0 x) y
      (mk-helper (- x 1) (cons x y) )))

(trace mk-helper)
(generate-report)

;tracing result

>   (mk-helper 10 '())
>   (mk-helper 9 '(10))
>   (mk-helper 8 '(9 10))
>   (mk-helper 7 '(8 9 10))
>   (mk-helper 6 '(7 8 9 10))
>   (mk-helper 5 '(6 7 8 9 10))
>   (mk-helper 4 '(5 6 7 8 9 10))
>   (mk-helper 3 '(4 5 6 7 8 9 10))
>   (mk-helper 2 '(3 4 5 6 7 8 9 10))
>   (mk-helper 1 '(2 3 4 5 6 7 8 9 10))
>   (mk-helper 0 '(1 2 3 4 5 6 7 8 9 10))
<     '(1 2 3 4 5 6 7 8 9 10)
; The test passed!

;result
(make-list 5)     ;=>  '(1 2 3 4 5)
(make-list 30)    ;=>  '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)

(define (making_list len)
(cdr (build-list (+ len 1) (lambda (x) x))))

;result
(making_list 8)   ;=>  '(1 2 3 4 5 6 7 8)
(making_list 0)   ;=>  '()
(making_list 9)   ;=>  '(1 2 3 4 5 6 7 8 9)
