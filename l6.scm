; 练习1
; 用map编写下面的函数：

; 一个将表中所有元素翻倍的函数；
(define (map-double ls)
  (map (lambda (x) (* x 2)) ls))

(map-double '(1 2 3 4))


; 一个将两个表中对应位置元素相减的函数
(define (map-reduce ls1 ls2)
  (map - ls1 ls2))

(map-reduce '(2 2 3) '(4 5 6))


; 练习2
; 编写下列函数：

; 滤取（Filtering Out）出一个表中的偶数；
(define (filter-out-even ls)
  (keep-matching-items ls even?))

(define (filter-out-even1 ls)
  (delete-matching-items ls odd?))

(filter-out-even '(1 2 3 4 5 6 6))
(filter-out-even1 '(1 2 3 4 5 6 6))

; 滤取出不满足10 ≤ x ≤ 100的数；
(define (filter-out-10-100 ls)
  (delete-matching-items ls (lambda (x) (<= 10 x 100) )))

(filter-out-10-100 '(1 2 3 4 11 15 99 100 101 102))


; 练习3
; 编写一个将表中所有元素平方的函数，然后求取它们的和，最后求和的平方根。
(define (reduce-squ-sum-sqrt ls)
  (sqrt (reduce + 0 (map (lambda (x) (* x x)) ls))))

(reduce-squ-sum-sqrt '(1 2 3))


; 练习4
; 编写下列函数

; 以sin(x)的大小升序排序；
(define (sort-sin ls)
  (sort ls (lambda (x y) (< (sin x) (sin y)))))

(sort-sin '(1 2 3 4 5 6))

; 以表长度降序排序；
(define (sort-len ls)
  (sort ls (lambda (x y) (> (length x) (length y)))))

(sort-len '((1 2 3) (1) (2 3)))



; 练习5
; 用apply编写练习3中的函数。
; 练习3
; 编写一个将表中所有元素平方的函数，然后求取它们的和，最后求和的平方根。

(define (apply-squ-sum-sqrt ls)
  (sqrt (apply + (map (lambda (x) (* x x)) ls))))

(apply-squ-sum-sqrt '(1 2 3))



; 练习 6
; 自己实现keep-matching-items。
(define (my-keep-matching-items ls proc)
  (cond
    ((null? ls) '())
    ((proc (car ls)) (cons (car ls) (my-keep-matching-items (cdr ls) proc)))
    (else (my-keep-matching-items (cdr ls) proc))))

(my-keep-matching-items '(1 2 3 4) even?)


; 自己实现map。接受不止一个表作为参数可能有点困难。剩余的参数是通过带点得序对(.)来定义的。其cdr部分以表的形式传递给函数。 例: my-list
; (define (my-list . x) x)
; 多说一句，你需要apply函数。

(define (my-map fun . lss)
  (letrec ((iter (lambda (fun lss)
                   (if (null? lss)
                     '()
                     (cons (fun (car lss))
                           (iter fun (cdr lss))))))
           (map-rec (lambda (fun lss)
                      (if (memq '() lss)
                        '()
                        (cons (apply fun (iter car lss))
                              (map-rec fun (iter cdr lss)))))))
    (map-rec fun lss)))
; 这题自己没想到
; 这里操作是每次都将lss的每个列表第一个取出来，(iter car lss)便是做这事
; (if (memq '() lss)) 此处可以忽略列表长度不一的问题

(my-map + '(1 2 3 4) '(10 20 30 40) '(100 200 300 400))



; (load "l6.scm")
