; 练习1
; 用递归编写下面的函数。

; 用于统计表中元素个数的my-length函数。（length是一个预定义函数）。
(define (my-length ls)
  (if (null? ls)
    0
    (+ 1 (my-length (cdr ls)))))

(my-length '(1 2 3 5 7))

; 一个求和表中元素的函数。
(define (my-sum ls)
  (if (null? ls)
    0
    (+ (car ls) (my-sum (cdr ls)))))

(my-sum '(1 2 3 4 5))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。
(define (del-elm ls x)
  (if (null? ls)
    '()
    (let ((h (car ls)))
      ((if (eqv? x h)
         (lambda (y) y)
         (lambda (y) (cons h y)))
       (del-elm (cdr ls) x)))))

(del-elm '(1 2 3 4 5) 3)

; 一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。索引从0开始。如果x不在ls中，函数返回#f。
(define (index-of ls x acc)
  (cond
    ((null? ls) #f)
    ((eqv? x (car ls)) acc)
    (else (index-of (cdr ls) x (+ 1 acc)))))

(index-of '(1 2 3 4 5) 3 0)



; 练习2
; 用尾递归编写下面的函数

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）
(define (my-reverse ls)
  (my-reverse-1 ls '()))

(define (my-reverse-1 ls acc)
  (cond
    ((null? ls) acc)
    (else (my-reverse-1 (cdr ls) (cons (car ls) acc )))))

(my-reverse '(1 2 3))


; 求和由数构成的表。
(define (my-sum ls)
  (my-sum-rec ls 0))

(define (my-sum-rec ls acc)
  (cond
    ((null? ls) acc)
    (else (my-sum-rec (cdr ls) (+ (car ls) acc)))))

(my-sum '(1 2 3 4))


; 将一个代表正整数的字符串转化为对应整数。例如，"1232"会被转化为1232。不需要检查不合法的输入。提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，可以使用函数char->integer来获得字符的ASCII码。函数string->list可以将字符串转化为由字符构成的表。
(define (str2int str)
  (str2int-rec (string->list str) 0))

(define (str2int-rec ls acc)
  (cond
    ((null? ls) acc)
    (else (str2int-rec (cdr ls) (+ (- (char->integer (car ls)) 48) (* 10 acc))))))

(str2int "1234")
(str2int "5478")



; 练习3
; 用命名let编写下面的函数。

; 练习1的问题3和问题4；
; 一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。
(define (loop-test ls0 x0)
  (let loop((ls ls0) (acc '()))
    (if (null? ls)
      (reverse acc)
      (loop (cdr ls)
            (if (eqv? (car ls) x0)
              acc
              (cons (car ls) acc))))))

(loop-test '(1 2 3) 3)


; 一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。索引从0开始。如果x不在ls中，函数返回#f。
(define (loop-test1 ls x)
  (let loop((ls0 ls) (index 0))
    (if (null? ls0)
      #f
      (if (eqv? (car ls0) x)
        index
        (loop (cdr ls0) (+ 1 index))))))

(loop-test1 '(1 2 3 4) 3)
(loop-test1 '(1 2 3 4) 5)

; 练习2中的函数；
; 练习2
; 用尾递归编写下面的函数

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）
(define (loop-my-reverse ls0)
  (let loop((ls ls0) (acc '()))
    (if (null? ls)
      acc
      (loop (cdr ls) (cons (car ls) acc)))))

(loop-my-reverse '(1 2 3 4))
(loop-my-reverse '(5 2 3 4))

; 求和由数构成的表。
(define (loop-sum ls)
  (let loop((ls0 ls) (acc 0))
    (if (null? ls0)
      acc
      (loop (cdr ls0) (+ (car ls0) acc)))))

(loop-sum '(1 2 3 4))
(loop-sum '(1 2 3 40))

; 将一个代表正整数的字符串转化为对应整数。例如，"1232"会被转化为1232。不需要检查不合法的输入。提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，可以使用函数char->integer来获得字符的ASCII码。函数string->list可以将字符串转化为由字符构成的表。

(define (loop-str2int str)
  (let loop((ls (string->list str)) (acc 0))
    (if (null? ls)
      acc
      (loop (cdr ls)
            (+ (* 10 acc) (- (char->integer (car ls)) 48))))))

(loop-str2int "1234")


; range函数：返回一个从0到n的表（但不包含n）。
(define (range n)
  (let loop((n0 (- n 1)) (acc '()))
    (if (eqv? n0 0)
      acc
      (loop (- n0 1) (cons n0 acc)))))

(range 10)



; 练习4
; 用letrec重写练习2。
; 练习2
; 用尾递归编写下面的函数

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）
(define (letrec-reverse ls)
  (letrec ((iter (lambda (ls0 acc)
                   (if (null? ls0)
                     acc
                     (iter (cdr ls0) (cons (car ls0) acc))))))
    (iter ls '())))

(letrec-reverse '(1 2 3 4))

; 求和由数构成的表。
(define (letrec-sum ls)
  (letrec ((iter (lambda (ls0 acc)
                  (if (null? ls0)
                    acc
                    (iter (cdr ls0) (+ (car ls0) acc))))))
    (iter ls 0)))

(letrec-sum '(1 2 3 4 5))

; 将一个代表正整数的字符串转化为对应整数。例如，"1232"会被转化为1232。不需要检查不合法的输入。提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，可以使用函数char->integer来获得字符的ASCII码。函数string->list可以将字符串转化为由字符构成的表。
(define (letrec-str2int str)
  (letrec ((iter (lambda (ls0 acc)
                   (if (null? ls0)
                     acc
                     (iter (cdr ls0)
                           (+ (* 10 acc) (- (char->integer (car ls0)) 48)))))))
    (iter (string->list str) 0)))

(letrec-str2int "1234")
(letrec-str2int "1236")





; 练习5
; 用do表达式重写练习2。
; 练习2
; 用尾递归编写下面的函数

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）
(define (do-reverse ls)
  (do ((ls0 ls (cdr ls0)) (acc '() (cons (car ls0) acc)))
    ((null? ls0) acc)))

(do-reverse '(1 2 3 4 5))


; 求和由数构成的表。
(define (do-sum ls)
  (do ((ls0 ls (cdr ls0)) (acc 0 (+ (car ls0) acc)))
    ((null? ls0) acc)))

(do-sum '(1 2 3 4 5))


; 将一个代表正整数的字符串转化为对应整数。例如，"1232"会被转化为1232。不需要检查不合法的输入。提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，可以使用函数char->integer来获得字符的ASCII码。函数string->list可以将字符串转化为由字符构成的表。
(define (do-str2int str)
  (do ((ls0 (string->list str) (cdr ls0)) (acc 0 (+ (* 10 acc) (- (char->integer (car ls0)) 48))))
    ((null? ls0) acc)))

(do-str2int "812345")

; (load "l5.scm")
