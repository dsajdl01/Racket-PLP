#lang racket
(define x (list 'fred (list 'betty 'john) 'malacon))
(define p (list (list 'fine (list 'that 'is 'good 'to 'know))
                (list 'hello (list 'how 'can 'I 'help))))
(define my-list (list 'this 'is (list (list 'how 'are 'you) 'wow) ' heavy))


; 1) get 'betty from x

(cdr x) ;=> '((betty, john) malacon)
(car (cdr x)) ;=> '(betty, john)

(car (car (cdr x))) ;=> 'betty

; 2) get 'malacon from x 

(cdr x) ;=> '((betty, john) malacon)'
(cdr (cdr x)) ;=> '(malacon)

(car (cdr (cdr x))) ;=> 'malacon

; 3) get 'can fron p

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
(car (cdr (car (cdr (car p))))) ;=> 'is   !!! to get 'is value
(cdr (cdr (car (cdr (car p))))) ;=> '(good to know)
(car (cdr (cdr (car (cdr (car p)))))) ;=> 'good  !!! to get 'good value

;now join two arbitraty values by using cons
(cons (car (cdr (car (cdr (car p)))))
      (cons (car (cdr (cdr (car( cdr ( car p)))))) '()))  ;=> '(is good)

; 4) get 'wow from my-list
my-list ;=> '(this is ((how are you) wow) heavy)
(cdr my-list) ;=> '(is ((how are you) wow) heavy)
(cdr (cdr my-list)) ;=> '(((how are you) wow) heavy)
(car (cdr (cdr my-list))) ;=> '((how are you) wow)
(cdr (car (cdr (cdr my-list)))) ;=> '(wow)

(car (cdr (car (cdr (cdr my-list)))))  ;=>  'wow

; 5) get '(this is heavy) from my-list
;to join three values  
(cons 'is (cons 'this (cons 'good '()))) ;=>'(is this good)

my-list ;=> '(this is ((how are you) wow) heavy)
(car my-list) ;=>  'this !!! to get 'this value
(cdr my-list) ;=> '(is ((how are you) wow) heavy)
(car (cdr my-list)) ;=>  'is !!! to get 'is value 
(cdr (cdr my-list)) ;=> '(((how are you) wow) heavy)
(car (cdr (cdr my-list))) ;=> '((how are you) wow)
(cdr (cdr (cdr my-list))) ;=> '(heavy)
(car (cdr (cdr (cdr my-list)))) ;=>  'heavy !!! to get 'heavy value

;now join three arbitraty values by using cons
(cons (car my-list) (cons (car (cdr my-list))
               (cons (car (cdr (cdr (cdr my-list)))) '()))) ;=>    '(this is heavy)
> 