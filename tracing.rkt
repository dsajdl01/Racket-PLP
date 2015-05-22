#lang racket
(define x (list 'fred (list 'betty 'john) 'malacon))
(define p (list (list 'fine (list 'that 'is 'good 'to 'know))
                (list 'hello (list 'how 'can 'I 'help))))

; 1) get betty from x

(cdr x) ;=> '((betty, john) malacon)
(car (cdr x)) ;=> '(betty, john)

(car (car (cdr x))) ;=> 'betty

; 2) get malacon from x 

(cdr x) ;=> '((betty, john) malacon)'
(cdr (cdr x)) ;=> '(malacon)

(car (cdr (cdr x))) ;=> 'malacon

; 3) get can fron p

 p ;=> '((fine (that is good to know)) (hello (how can I help)))
(cdr p) ;=> '((hello (how can I help)))
(car (cdr p)) ;=> '(hello (how can I help))
(cdr (car (cdr p))) ;=> '((how can I help))
(car (cdr (car (cdr p)))) ;=> '(how can I help)
(cdr (car (cdr (car (cdr p))))) ;=> '(can I help)

(car (cdr (car (cdr (car (cdr p)))))) ;=> 'can

; 3) get '(is good) fron p
(cons 'is 'good) ;=> '(is . good)
(cons 'is (cons 'good '() )) ;=> '(is good)
p ;=> '((fine (that is good to know)) (hello (how can I help)))
(car p) ;=> '(fine (that is good to know))
(cdr (car p)) ;=> '((that is good to know))
(car (cdr (car p))) ;=> '(that is good to know)
(cdr (car (cdr (car p)))) ;=> '(is good to know)
(car (cdr (car (cdr (car p))))) ;=> 'is   !!!
(cdr (cdr (car (cdr (car p))))) ;=> '(good to know)
(car (cdr (cdr (car (cdr (car p)))))) ;=> 'good  !!!

(cons (car (cdr (car (cdr (car p)))))
      (cons (car (cdr (cdr (car( cdr ( car p)))))) '()))  ;=> '(is good)