#lang sicp



(define (psc row col)
  (cond

    ((= col 1) 1)
    ((> col row) 0 )
    ((< col 0) 0)
    ((+ (numbr (- row 1) (- col 1)) (psc (- row 1) col)))))
(numbr 10 8)