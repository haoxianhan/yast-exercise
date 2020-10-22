; 练习1
; 编写一个宏，其语义为：当谓词求值为假时执行相应的表达式。（语义与when相反。）

(define-syntax my-unless
  (syntax-rules ()
    ((_ pred b1 ...)
     (if (not pred) (begin b1 ...)))))


(let ((i 1))
  (my-unless (= i 10)
             (display i)
             (newline)))




; 练习2
; 编写用于从变量中减去一个数的宏decf。如果减量省略了，则从变量中减1。
(define-syntax decf
  (syntax-rules ()
    ((_ x) (begin
             (set! x (- x 1))
             x))
    ((_ x v) (begin
               (set! x (- x v))
               x))))

(let ((i 10) (j 10))
  (decf i)
  (decf j 5)
  (display (list 'i '= i))
  (newline)
  (display (list 'j '= j)))


; 练习3
; 改进[代码3]中的宏for，使得它可以接受一个参数作为步长。如果省略了步长，则默认为1。
; [代码3]
(define-syntax for
  (syntax-rules ()
    ((_ (i from to) b1 ...)
     (let loop((i from))
       (when (< i to)
         b1 ...
         (loop (1+ i)))))
    ((_ (i from to step) b1 ...)
     (let loop((i from))
       (when (< i to)
         b1 ...
         (loop (+ i step)))))))

(for (i 0 10)
     (display i)
     (display #\Space))

(for (i 0 10 2)
     (display i)
     (display #\Space))



; 练习4
; 请自己实现let*。

(define-syntax my-let*
  (syntax-rules ()
    ((_ ((def1 val1)) e ...)
     (let ((def1 val1)) e ...))
    ((_ ((def1 val1) (def2 val2) ...) e ...)
     (let ((def1 val1))
       (my-let* ((def2 val2) ...)
                e ...)))))

(my-let* ((c 1) (c1 (+ c 1)))
         (display (list c c1)))



; (load "l12.scm")
