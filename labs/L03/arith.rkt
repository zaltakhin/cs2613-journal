(check-expect (and true true) true)       ; Both true, evaluates to true
(check-expect (and true false) false)     ; Short-circuits with false
(check-expect (and false true) false)     ; Short-circuits with first false
(check-expect (and true true true) true)  ; All true, evaluates to true
(check-expect (and) true)                 ; Empty and, evaluates to true

(check-expect (or true false) true)       ; Short-circuits with true
(check-expect (or false true) true)       ; Evaluates second, true
(check-expect (or false false) false)     ; All false, evaluates to false
(check-expect (or) false)                 ; Empty or, evaluates to false



(check-expect (and true true) true)       ; Both true, evaluates to true
(check-expect (and true false) false)     ; Short-circuits with false
(check-expect (and false true) false)     ; Short-circuits with first false
(check-expect (and true true true) true)  ; All true, evaluates to true
(check-expect (and) true)                 ; Empty and, evaluates to true

(check-expect (or true false) true)       ; Short-circuits with true
(check-expect (or false true) true)       ; Evaluates second, true
(check-expect (or false false) false)     ; All false, evaluates to false
(check-expect (or) false)                 ; Empty or, evaluates to false

