(define zeros
  (lambda (n)
    (if (< n 1)
        '()
        (cons 0 (zeros (- n 1))))))

(define up-degree
  (lambda (poly n)
    (append (zeros n) poly)))

(define scalar
  (lambda (poly d)
    (if (null? poly)
        '()
        (cons (* d (car poly)) (scalar (cdr poly) d)))))



(define poly-eval
  (lambda (poly x)
    (cond 
      ((= (length poly) 0) 0)
      ((= (length poly) 1) (car poly))
      (else 
        (+ (car poly) (* x (poly-eval (cdr poly) x)))))))


(define poly-add
  (lambda (p1 p2)
    (cond
      ((null? p1) p2)
      ((null? p2) p1)
      (else
       (cons (+ (car p1) (car p2))
             (poly-add (cdr p1) (cdr p2)))))))



(define poly-mul
  (lambda (p1 p2)
    (if (null? p2)
        '(0)
        (poly-add (scalar p1 (car p2))
             (poly-mul (up-degree p1 1) (cdr p2))))))


(define diff-mul
    (lambda (p x)
        (cond
            ((null? p) '())
            (else
                (cons (* (car p) x) (diff-mul (cdr p) (+ x 1)))))))
                
(define poly-diff 
(lambda (p)
    (cond
        ((null? p) '())
        ((= (length p) 1) '())
        (else
            (diff-mul (cdr p) 1)))))
            
            
(define int-div
    (lambda (p x)
        (cond
            ((null? p) '())
            (else
                (cons (/ (car p) x) (int-div (cdr p) (+ x 1)))))))
                
(define poly-int 
(lambda (p)
    (cond
        ((null? p) '())
        ((= (length p) 1) '())
        (else
            (cons 0 (int-div p 1))))))


(define is-poly
  (lambda (s x)
    (cond
      ((equal? (car s) 'poly) (poly-eval(cdr s) x))
      (else
       (cons (car s) (grovel-poly-eval (cdr s) x))))))

(define grovel-poly-eval
  (lambda (s x)
    (cond
      ((null? s) '())
      (else
       (cond
         ((list? (car s)) (cons (is-poly (car s) x) (grovel-poly-eval (cdr s) x)))
         (else
          (cons (car s) (grovel-poly-eval (cdr s) x))))))))

(define extra-mult 
  (lambda (replacement index)
  (cond
    ((equal? index 0 ) '(1))
    ((equal? index 1 ) replacement)
    ((equal? index 2 ) (poly-mul replacement replacement))
    (else
      (poly-mul replacement (extra-mult replacement (- index 1))))
    )))

(define add-extra
  (lambda (poly index replacement)
    (cond
      ((null? poly) '())
      (else 
        (poly-add (scalar (extra-mult replacement index) (car poly)) (add-extra (cdr poly) (+ index 1 ) replacement) ))
      )
  ))

(define poly-shift 
  (lambda (p s)
    (cond 
      ((null? p) '())
      ((= (length p) 1) car p)
      (else 
        (let ([replacement (cons s '(1))])
          (add-extra p 0 replacement)
        )
        )
      
      
      )
  ))
