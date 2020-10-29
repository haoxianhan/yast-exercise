(+ 1 1)

(- 1 2 3)

(/ 29 3)

(exact->inexact (/ 29 3))

(quotient 7 3)

(remainder -7 3)

(modulo -7 3)

(sqrt 16)

(exp 3)

(expt 2  3)

(log 10)

(cons 1 2)

(cons 4 (cons 3 (cons 1 2)))

(cons (cons (cons 1 2) (cons 1 2)) (cons 1 2))

(car '(1 2 3))

(cdr '(1))

(cdr '(1 . 2))

(define cc)
(* 3 (* 3 (call/cc (lambda (k)
                     (set! cc k)
                     (+ 1 2)))))


(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

