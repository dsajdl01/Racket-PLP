#lang racket
(define f 
  (let ([y 0])
    (lambda ()
      (begin (set! y (+ y 1))
             (let ([x y])
               (lambda () x))))))
(define w ((f)))  
(define y (f))
(define x (list ((f)) ((f)) ((f))))
(define s (f))
(define z (list (y) (y) (s) (y) (y)))

;result
> w ;=> 1
> y ;=> #<procedure>
> x ;=> '(3 4 5)
> s ;= #<procedure>
> z ;=> '(2 2 6 2 2)
> x ;=> '(3 4 5)
> z ;=> '(2 2 6 2 2)

(define ( my-reverse l)
  (if (null? l) '()
      (append (my-reverse (cdr x)) (list (car (x))))))