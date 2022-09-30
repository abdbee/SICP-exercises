#lang sicp

; exercise 1.2
(/(+
    5
    4
    (- 2
       (- 3
        (+ 6
           (/ 4 5)))))
  (* 3
      (- 6 2)
      (- 2 7)))

; exercise 1.3 define a procedure that takes three numbers as arguments and returns the sum of the squres of the two larger numbers
(define (larger x y z)
  (cond ((and (< x y) (< x z)) (+ (* y y) (* z z)))
        ((and (< y x) (< y z)) (+ (* x x) (* z z)))
        ((and (< z y) (< z x)) (+ (* y y) (* x x)))))
     
(larger 3 4 5)

; exercise 1.4 describe the behavior of the following procedure
(define (a-times-abs-b a b)
  ((if (> b 0) * /) a b ))
(a-times-abs-b 5 5)
; notice how the if expression is the operator here. ie, whatever the exression evaluates to, will be the operator for the combination

; exercise 1.5 observations with an interpreter that uses normal-order evaluation vs with applicative order evaluation
;(define (p) (p))
;(define (test x y)
;  (if (= x 0) 0 y))
;(test 0 (p))

; for normal-order evaluation, the expression is fully expanded, and then the operator is applied in all operands before reduction. in this case, the if statement is applied
; to 0 and p, of which the predicate evaluates to true. hence, 0 is returned. 

; for applicative - order evaluation, each argument is evaluated first before the procedure of the combination's operator is applied. in this case, 0 evaluates to 0, but (p) will keep on evaluating to
; (p) and will never have a definite value. hence, with applicative - order evaluation, the program runs infinitely

; Notice that normal-order evaluation for this procedure will work if a normal-order evaluation interpreter is used, because the predicate evaluated to true. But if you change the number to anything other than 0 (1 for example), the predicate evaluates to false. hence,
; the consequent expression ((p)) in this case has to be reduced. But (p) always calls itself recursively and no finite value is gotten. hence, the program will run forever and never return anything





; Exercise 1.8 - Newton's method for cube root

(define (improve guess x)
   (/ (+ (/ x
       (* guess guess)) (* 2 guess))
      3)
  )

(define (cube guess x)
  (if (<(abs(- guess (improve guess x))) (* guess (/ 1 10000)))
      guess
      (cube (improve guess x) x)
        
  ))

(cube 1 100)
















