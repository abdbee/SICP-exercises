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
; this method uses a linear recursive process, since the length of the chain of deffered multiplications grow linearly with n.
(define (another-factorial n)
  (if (= n 1)
      1 ; not that this is returned to the innermost parenthesis in the recursion
      (* n (another-factorial (- n 1))
      )))

(another-factorial 4)


; fourth implementation. In this case, all we need to keep track of are the value of the formal parameters. This is a recursive procedure that generates an iterative process, because the state can be summarized by a fixed number
; of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state as well as an optional end test that specifies
; conditions under which the process should terminate. The state is the only thing the interpreter needs to keep track of in order to execute the process. This is a linear iterative process, because the number of steps required grow linearly with n.

(define (multiplier2 x y) (* x y))


(define (inner2 x y n)
    (if (> y n) x (inner2 (multiplier2 x y) (+ y 1) n))
  )

(define (factorial2 n) (inner2 1 1 n))

(factorial2 4)