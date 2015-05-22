(require srfi/1)

; 1.
; (a) 
(* 2 (+ 4 5)) ; 18
; (b)
(= 3 (+ 1 3)) ;#f
;(c)
(car '(elmer fudd daffy duck)) ; 'elmer
;(d)
(cdr '(elmer fudd daffy duck)) ; '(fudd daffy duck)
;(e)
(and (= 1 2) (= 10 (/ 1 0))) ; #f

; 2.
(define (findSquid alist)
    (cond ((null? alist) #f)
          ((equal? 'squid (car alist)) #t)
          (else (findSquid (cdr alist)))))
          
(findSquid '(clam squid octopus)) ; #t

--------------------------------------------------------------
(define z'(clam starfish (squid octopus) mollusc))
(define b'(clam starfish squide (octopus) mollusc))
(define c'(clam starfish squid (octopus) mollusc))

(define (findSquid alist)
    (cond ((null? alist) #f)
          ((equal? 'squid (car alist)) #t)
          (else (append (findSquid (cdr alist)))))) ; not working yet
          
--------------------------------------------------------------------------
; 3.
(define (average x y)
    ( / (+ x y) 2))
(average 45 11)   ; 28

; 4
(define (mymax x y)
    (if (> x y)
        x
        y))
(mymax 1 5)  ; 5

; 5
(define x '(snail clam))
(define y '(octopus squid scallop))

(cons 'geoduck x)  ; '(geoduck snail clam)

(cons y y)  ; '((octopus squid scallop) octopus squid scallop)

(append x y) ;'(snail clam octopus squid scallop)

(cdr y) '(squid scallop)

; 6.
(define (sum1 lst)
    (if (null? lst) 
        0
       (+ (car lst) (sum1 (cdr lst)))
       )) 
(define t '(2 6 4 3 5 7) ) 
(sum1 t); 27

:7
#lang racket
 (define (sum x)
    (getsum x 0))
(define (getsum x y)
    (if (null? x)
        y
       (getsum (cdr x) (+ y (car x)))))
(define k '(1 8 4 9 5 7) ) 
(sum k) ; 34


;8
;(a)
(let ((x (+ 2 4))
	  (y 100))
	  (+ x y)) ; 108
;(b)
 (let ((x 100)
	 ( y 5))
	 (let ((x 1))
	 (+ x y))) ;6
;9.
(define s '(2 6 4 3 5 7) )
(define (getlength x)
    (length x)) (getlength s) ; 6







