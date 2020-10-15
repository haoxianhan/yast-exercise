; 练习1

; 编写函数(read-lines)，该函数返回一个由字符串构成的表，分别代表每一行的内容。在Scheme中，换行符是由#\Linefeed表示。下面演示了将该函数用于"hello.txt"的结果。

; (read-lines "hello.txt") ⇒ ("Hello world!" "Scheme is an elegant programming language.")

(define (read-lines file-name)
  (with-input-from-file file-name
                        (lambda ()
                          (let loop((ls1 '()) (res '()) (c (read-char)))
                            (cond
                              ((eof-object? c) (map list->string (reverse res)))
                              ((eqv? #\linefeed c) (loop '() (cons (reverse ls1) res) (read-char)))
                              (else (loop (cons c ls1) res (read-char))))))))

(read-lines "l7.txt")

; 练习2
; 编写函数(my-copy-file)实现文件的拷贝。
(define (my-copy-file from-file to-file)
  (let ((from-p (open-input-file from-file))
        (to-p (open-output-file to-file)))
    (let loop ((c (read-char from-p)))
      (if (eof-object? c)
        (begin (close-input-port from-p)
               (close-output-port to-p))
        (begin (write-char c to-p)
               (loop (read-char from-p)))))))

(my-copy-file "l7.txt" "tl7.txt.bak")

; 练习3
; 编写函数(print-line)，该函数具有任意多的字符作为参数，并将它们输出至标准输出。输出的字符应该用新行分隔。

(define (print-line . lines)
  (let loop ((lines0 lines))
    (if (not (null? lines0))
      (begin (display (car lines0))
             (newline)
             (loop (cdr lines0))))))

(print-line "1234" "abc" "567")


; (load "l7.scm")
