#lang sicp

; first implementation

(define (multiplier x y) (* x y))


(define (inner x y n)
    (if (= y n) x (inner (multiplier x (+ y 1)) (+ y 1) n))
  )

(define (factorial n) (inner 1 1 n))

(factorial 4)


; second implementation

(define (factor x n)
   (if (<= n 1) x (factor (* x (- n 1)) (- n 1)))
  )

(define (another_factorial x) (factor x x))

(another_factorial 4)