#lang htdp/bsl

(define-struct Z ())
(define-struct S (pred)) 

(define (pred nat)
  (cond
    [(Z? nat) (error "can't apply pred to Z")]
    [(S? nat) (S-pred nat)]))

(define (plus nat1 nat2)
  (cond
    [(Z? nat1) nat2] 
    [(S? nat1) (make-S (plus (S-pred nat1) nat2))]))

(define (times nat1 nat2)
  (cond
    [(Z? nat1) (make-Z)] 
    [(S? nat1) (plus nat2 (times (S-pred nat1) nat2))])) 

(define (compare nat1 nat2)
  (cond
    [(Z? nat1) (cond
                 [(Z? nat2) 'equal] 
                 [(S? nat2) 'less])] 
    [(S? nat1) (cond
                 [(Z? nat2) 'greater] 
                 [(S? nat2) (compare (S-pred nat1) (S-pred nat2))])])) 

(define (sum-factors n max-factor)
  (cond
    [(zero? max-factor) 0]
    [(= (remainder n max-factor) 0) (+ max-factor (sum-factors n (sub1 max-factor)))]
    [else (sum-factors n (sub1 max-factor))]))

(define zero (make-Z))
(define one (make-S zero))
(define two (make-S one))
(define three (make-S two))

(check-expect (pred three) two)
(check-expect (pred two) one)
(check-error (pred zero))

(check-expect (plus zero one) one)
(check-expect (plus one two) three)
(check-expect (plus two zero) two)

(check-expect (times zero one) zero)
(check-expect (times one two) two)
(check-expect (times two three) (plus three three))

(check-expect (compare zero zero) 'equal)
(check-expect (compare zero one) 'less)
(check-expect (compare one zero) 'greater)
(check-expect (compare two two) 'equal)
(check-expect (compare three two) 'greater)
(check-expect (compare one three) 'less)

(check-expect (sum-factors 6 5) 6)
(check-expect (sum-factors 28 27) 28)
