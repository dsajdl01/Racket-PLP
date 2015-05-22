#lang racket
(require srfi/48)
(define x  5)
(let ((x 3)
        (y (+ x 1)))
    (+ x y))

(let* ((x 3)
        (y (+ x 1)))
    (+ x y))

(define (flip x y)
  (let ((x (+ y 1))
        (y (- x 10)))
    (+ x y)))

(define (way-too-many-lets x y z)
  (let ((x (+ x y))
        (y (- x y)))
    (let ((x (* x 2))
          (y (* x y 10)))
      (+ x y z))))
(define (sum xw)
  (if (null? xw) 1
      (* (car xw) (sum (cdr xw)))))
(define (my-append x y)
  (if (null? x) y
      (cons (car x) (my-append (cdr x) y))))

(define l '(D E T R))
(define (all-positive x)
  (cond ((null? x) #t)
        ((<= (car x) 0) #f)
        (else (all-positive (cdr x)))))
(define (my-member e r)
  (cond ((null? r) #f)
        ((equal? e (car r)) #t)
        (else (my-member e (cdr r)))))
 (define (my-map f s)
    (if (null? s) '()
    (cons (f (car s)) (my-map f (cdr s)))))

(define (my-filter f s)
    (cond ((null? s) '())
          ((f (car s)) (cons (car s) (my-filter f (cdr s))))
          (else (my-filter f (cdr s)))))

