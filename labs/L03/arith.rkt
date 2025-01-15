#lang htdp/bsl

(define (my-+ a b)
  (cond
    [(zero? a) b]
    [else (my-+ (sub1 a) (add1 b))]))

(define (my-* a b)
  (cond
    [(zero? a) 0]
    [(> a 0) (my-+ (my-* (sub1 a) b) b)]
    [else (error "Unhandled case")]))
