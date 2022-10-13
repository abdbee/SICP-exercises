#lang sicp

(define (numbr row col)
  (if (or (= col 1) (= col row)) 1 (+ (numbr (- row 1) (- col 1)) (numbr (- row 1) col))))

(numbr 10 4)