#lang scheme
;2018 January

;Define a Scheme function tear which takes two arguments, a
; predicate p? and a list xs, and returns a list of two lists, the
; first of which is the elements of xs that pass p?, and the second
; of which is the elements of xs that fail it, both in order.

(define (tear-filter p? xs)
  (list (filter p? xs) (filter (lambda (x)(not (p? x))) xs)))

;(tear number? '(a b c 1 2 3 d e f))

;2017 January

; Define a Scheme function tear which takes two arguments, a
; predicate p? and a list xs, and returns a list of two lists, the
; first of which is the elements of xs that pass p?, and the second
; of which is the elements of xs that fail it, both in order.

(define (foo pred? lst)
  (define x (flatten lst))
  
  (define (filtering l)
    (cond
      ((null? l) null)
      ((pred? (car l)) (cons (car l) (filtering (cdr l))))
      (else (filtering (cdr l)))))
  (filtering x)
  )

;(foo number? '(a (2 (c 3) 4)))

;2016 January

;Define a Scheme function reverse-with-count which takes two
;lists, the second of which is a list of non-negative integers the
;same length as the first list, and returns a list of elements from
;the first list, in reverse order, each repeated a number of times
;as specified by the corresponding element of the second list.
(define (reverse-with-count lstletters lstnumbers)

  (define (algorithm letters numbers)
  (cond
    ((or (null? letters) (null? numbers)) null)
    ((= (car numbers) 0) (algorithm (cdr letters) (cdr numbers)))
    ((cons (car letters) (algorithm letters (cons (- (car numbers) 1) (cdr numbers))))
    )
    ))
  (algorithm (reverse lstletters) (reverse lstnumbers))
  )
(reverse-with-count '(a b c) '(1 2 3))