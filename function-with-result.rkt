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

(define (my-reverse l)
  (if (null? l) 
      '()
      (append (my-reverse (cdr l)) (list (car l)))
  )
)

(define (rev x) 
  (rev-help x '()))

(define (rev-help x y)
  (if (null? x) y
      (rev-help (cdr x) (cons (car x) y))))

(define a '(1 2 3 4 5))

;result
a '(1 2 3 4 5)
(my-reverse a) ;=> '(5 4 3 2 1)
(rev '(a b c d e)) ;=> '(e d c b a)
 
(define (my-append x y)
  (if (null? x) y
      (cons (car x) (my-append (cdr x) y))))

 ;result
 (my-append a '(a b c)) ;=> '(1 2 3 4 5 a b c)     

(define (my-fac x)
  (if (eq? 0 x) 1
      (* x (my-fac (- x 1)))))

(define (fact x)
  (fact-help x 1))
(define (fact-help x y)
  (if (eq? x 0) y
      (fact-help (- x 1) (* x y))))

 ;result
(my-fac 3)  ;=>  6
(fact 5)    ;=>  120
(fact 7)    ;=>  5040
(my-fac 10) ;=>  3628800
(my-fac 3)  ;=>  6

(define (fib x)
  (if (<= x 2) 1
      (+ (fib (- x 1)) (fib (- x 2)))))

;result
(fib 5)	 ;=>  5
(fib 8)	 ;=>  21
(fib 12) ;=>  144
(fib 30) ;=>  832040

(define (sum x)
  (if (null? x) 0
      (+ (car x) (sum (cdr x)))))

(define (sum2 x)
  (sum-help x 0))
(define (sum-help x y)
  (if (null? x) y
      (sum-help (cdr x) (+ (car x) y))))

;resulr
z	;=> '(2 2 6 2 2)
x	;=> '(3 4 5)
a 	;=> '(1 2 3 4 5)
(sum x) 	;=> 12
(sum z)		;=> 14
(sum2 a) 	;=> 15
(sum2 z) 	;=> 14