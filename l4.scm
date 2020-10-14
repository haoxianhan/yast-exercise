
; 练习1

; 编写下面的函数。阅读第五节了解如何编写谓词。

; 返回一个实数绝对值的函数。
(define (my-abs num)
  (if (>= num 0)
    num
    (* -1 num)))

(my-abs 4)
(my-abs -5)


; 返回一个实数的倒数的函数。如果参数为0，则返回#f。
(define (my-reciprocal num)
  (if (eqv? num 0)
    #f
    (/ 1 num)))

(my-reciprocal 10)
(my-reciprocal 2)
(my-reciprocal 0)

; 将一个整数转化为ASCII码字符的函数。只有在33~126之间的ASCII码才能转换为可见的字符。使用integer->char可以将整数转化为字符。如果给定的整数不能够转化为字符，那么就返回#f。
(define (int2chr num)
  (if (<= 33 num 126)
    (integer->char num)
    #f))

(int2chr 1)
(int2chr 51)
(int2chr 97)


; 练习2

; 编写下面的函数。

; 一个接受三个实数作为参数的函数，若参数皆为正数则返回它们的乘积。
(define (prod3 a b c)
  (and (positive? a)
       (positive? b)
       (positive? c)
       (* a b c)))

(prod3 1 2 3)
(prod3 -1 2 3)


; 一个接受三个实数作为参数的函数，若参数至少一个为负数则返回它们的乘积。
(define (prod31 a b c)
  (if (or (negative? a)
          (negative? b)
          (negative? c))
          (* a b c)))

(prod31 1 2 3)
(prod31 1 2 -3)
(prod31 1 -2 -3)


; 练习 3

; 编写下列函数。

; 成绩（A-D）是由分数决定的。编写一个将分数映射为成绩的函数，映射规则如下：

; A 如果 score ≥ 80
; B 如果 60 ≤ score ≤ 79
; C 如果 40 ≤ score ≤ 59
; D 如果 score < 40
(define (score-grade score)
  (cond
    ((<= 80 score) "A")
    ((<= 60 score 79) "B")
    ((<= 40 score 59) "C")
    (else "D")))

(score-grade 90)
(score-grade 71)
(score-grade 30)


(pair? '()) ; 空表不是pair
(pair? (cons 1 2)) ; list 和 cons 都是pair
(pair? (list 1 2)) ; list 和 cons 都是pair

(list? (cons 1 2)) ; #f cons 1 2 => 1 . 2 不是严格列表

(list? (cons (cons 1 2) '())) ; #t (cons (cons 1 2) '()) => (1 2) 是严格列表

; (load "l4.scm")
