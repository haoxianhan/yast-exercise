; 练习1
; 编写一个函数title-style，该函数用于将每个单词的首字母大写。
; (title-style "the cathedral and the bazaar")
; ;⇒ "The Cathedral And The Bazaar"

(define (title-style str)
  (let loop((str0 (string->list str)) (change #t) (acc '()))
    (if (null? str0)
      (list->string (reverse acc))
      (let* ((c (car str0)) (cc (char-whitespace? c)))
        (loop (cdr str0)
              (char-whitespace? c)
              (cons (if (eq? change #t)
                      (char-upcase c)
                      c)
                    acc))))))


(title-style "the cathedral and the bazaar")

; (load "l9.scm")
