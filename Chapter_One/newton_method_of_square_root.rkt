#lang sicp

;; ----------- implementation one ----------------
(define (average guess x) (/ (+ guess x) 2))
(define (newguess oldguess x) (average oldguess (/ x oldguess)))


(define (error newguess x) (abs (- (* newguess newguess ) x)))

(define (sqrt guess x)
  (if (< (error(newguess guess x) x) (*(/ 1 10000000000) guess)) guess (sqrt (newguess guess x) x)))


;; ---------------- implementation two ----------------

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) (*(/ 1 10000000000) guess) ))   

(define (average2 x y)
  (/ (+ x y) 2))
(define (improve guess x)
    (average2 guess (/ x guess)))

(define ( sqrt-of guess x)
    (if (good-enough? guess x)
       guess
       (sqrt-of (improve guess x) 
                 x))
)

; try changing the error margin to multiple fractions of the guess, and see how this affects the accuracy of the result for smaller and larger values
(sqrt 1 25)

(sqrt-of 1 250000)