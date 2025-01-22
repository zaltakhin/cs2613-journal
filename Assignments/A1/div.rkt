#lang htdp/bsl

(define-struct Z ())
(define-struct S (pred))

(define zero (make-Z))
(define one (make-S zero))
(define two (make-S one))
(define three (make-S two))
(define four (make-S three))

(define (sub nat1 nat2)
  (cond
    [(Z? nat1) (cond
                 [(Z? nat2) zero]
                 [(S? nat2) (error "negative numbers not implemented")])]
    [(S? nat1) (cond
                 [(Z? nat2) nat1]
                 [(S? nat2) (sub (S-pred nat1) (S-pred nat2))])]))

(define (less nat1 nat2)
  (cond
    [(Z? nat1) (not (Z? nat2))]
    [(S? nat1) (cond
                 [(Z? nat2) false]
                 [(S? nat2) (less (S-pred nat1) (S-pred nat2))])]))

(define (div nat1 nat2)
  (cond
    [(Z? nat2) (error "divide by zero")]
    [(less nat1 nat2) zero]
    [else (make-S (div (sub nat1 nat2) nat2))]))


(check-expect (sub zero zero) zero)
(check-expect (sub four two) two)
(check-error (sub one four) "negative numbers not implemented")


(check-expect (less zero zero) false)
(check-expect (less two four) true)
(check-expect (less four two) false)
(check-expect (less three three) false)


(check-error (div zero zero) "divide by zero")
(check-error (div one zero) "divide by zero")
(check-expect (div four two) two)
(check-expect (div two one) two)
(check-expect (div four three) one)
