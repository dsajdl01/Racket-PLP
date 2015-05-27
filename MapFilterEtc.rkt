#lang racket

(define lst1 '(1 2 3 4 5) )
(define lst2 '(35 45 56 67)

; Map if function which operates on each element on the list 

(define (addPlus2forEachValueInList lst) 
  (map (lambda (x) (+ x 2)) lst))

(define (addEachValueInList lst v)
  (map (lambda (x) (+ x v)) lst)


; Result 
; (addPlus2forEachValueInList '(1 2 3 4 5))  	;=>  '(3 4 5 6 7)
;
; (addEachValueInList lst1 5) 					;=>  '(6 7 8 9 10)
; (addEachValueInList lst2 10) 					;=>  '(45 55 66 77

;to define your map 
(define (my-map f s)
  (if (null? s) '()
      (cons (f (car s)) (my-map f (cdr s)))))

; test my-map
(define (multiplyEachValueInList lst v)
  (my-map (lambda (x) (* x v)) lst))

; Result:
; (multiplyEachValueInList lst2 10) 		;=>  '(350 450 560 670)
; (multiplyEachValueInList lst1 5)  		;=>  '(5 10 15 20 25)

; Filter is a function that select specific value from the list

; e.g: (filter (lambde (X) (> x 0)) list)

(define (getGrearetValue lst v)
  (filter (lambda (x) (> x v)) lst))

(define (getAllSallerValueThen5 lst)
  (filter (lambda (x) (< x 5)) lst)

; Result:
; (getGrearetValue lst2 45) 			;=>  '(56 67)
; (getGrearetValue lst1 1) 				;=>  '(2 3 4 5)
;
; (getAllSallerValueThen5 lst1) 		;=>  '(1 2 3 4)
; (getAllSallerValueThen5 lst2) 		;=>  '()

; to define your filter :
(define (my-filter f s)
  (cond ((null? s) '())
        ((f (car s)) (cons (car s) (my-filter f (cdr s))))
        (else (my-filter f (cdr s)))
        ))
; testing
(define (getEvenNumber lst)
    (my-filter (lambda (n) (even? n)) lst))

; Result
; (getEvenNumber lst1) 	;=>  '(2 4)
; (getEvenNumber lst2) 	;=>  '(56) 

; curring when you carry a function you get a function back that accepts the 
: remaining arguments
;curring and lumbda

(define (expt-curring x)
`	(lambda (y) (expt x y)))

; Result;
;((expt-curring 4) 2) 		;=> 16

(define pow (lambda (x) (lambda (y)
                           (if (= y 0) 1
                               (* x ((pow x) (- y 1)))))))
(define (powerTwo n)
  ((pow n) 2))

(define (powerThree n)
  ((pow n) 3))

;Result:
; > (powerTwo 4)  	;=>  16
; (powerTwo 8)  	;=>  64
; (powerThree 8)  	;=>  512
; (powerThree 2) 	;=>  8
; (powerThree 4) 	;=>  64
