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

; (load "l7.scm")
