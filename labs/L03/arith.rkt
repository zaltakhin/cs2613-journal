#lang htdp/bsl

(define (my-+ a b)
  (cond
    [(zero? a) b]
    [else (my-+ (sub1 a) (add1 b))]))

(define (my-* a b)
  (cond
    [(zero? a) 0]
    [(> a 0) (+ b (my-* (sub1 a) b))]))

(check-expect (my-* 1 2) 2)
