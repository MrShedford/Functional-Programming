#lang scheme
;2018 August

;Define a Scheme function map-skip which takes a function and a
;list and returns the result of applying the given function to
;every other element of the given list, starting with the first
;element.
;Example:
;(map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6))
;=> (1001 2 1003 4 1005 6)

(define (map-skip fn lst)
  (cond
    ((= 1 (length lst)) (cons (fn (car lst)) null))
    ((null? lst) null)
    (else (cons (fn (car lst)) (cons (cadr lst) (map-skip fn (cddr lst)))))))

(map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6))

;2018 January

;Define a Scheme function tear which takes two arguments, a
; predicate p? and a list xs, and returns a list of two lists, the
; first of which is the elements of xs that pass p?, and the second
; of which is the elements of xs that fail it, both in order.

(define (tear-filter p? xs)
  (list (filter p? xs) (filter (lambda (x)(not (p? x))) xs)))

;(tear number? '(a b c 1 2 3 d e f))

; 2017 Autumn
; Define a Scheme function foo that takes two lists and yields a list combining all the
; elements in the two input lists, taking 1 from the first list, 2 from the second list, 3 from
; the first list, 4 from the second list, etc, until both are exhausted.
; Examples:
; (foo '(a b c d e f g) '(aa bb cc dd ee ff gg))
;  => (a aa bb b c d cc dd ee ff e f g gg)
; (foo '(a b c d e f g) '())
;  => (a b c d e f g)
; (foo '() '(aa bb cc dd ee ff gg))
;  => (aa bb cc dd ee ff gg)


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
;(reverse-with-count '(a b c) '(1 2 3))