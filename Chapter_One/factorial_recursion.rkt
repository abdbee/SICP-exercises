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

; third implementation. essentially, recursion keeps on substituting for the innermost parenthesis, until the stoping point is reached (ie, when the predicate is true),
;of which the predicate is returned and recursion stops
(define (another-factorial n)
  (if (= n 1)
      1 ; not that this is returned to the innermost parenthesis in the recursion
      (* n (another-factorial (- n 1))
      )))

(another-factorial 4)


; fourth implementation

(define (multiplier2 x y) (* x y))


(define (inner2 x y n)
    (if (> y n) x (inner2 (multiplier2 x y) (+ y 1) n))
  )

(define (factorial2 n) (inner2 1 1 n))

(factorial2 4)