; 练习 1
; 修改make-bank-account函数，使得如果取款超过余额则报错。提示：如果你的代码体中有多条 S-表达式，那么可以使用 begin 语句让它们成组。

; 示例
(define bank-account
  (let ((balance 10))
    (lambda (n)
      (set! balance (+ balance n))
      balance)))

(bank-account 20)
(bank-account -25)

; change here
(define (make-bank-account balance)
  (lambda (n)
    (if (negative? (+ balance n))
      #f
      (begin
        (set! balance (+ balance n))
        balance))))

(define gates-bank-account (make-bank-account 10))
(gates-bank-account 50)
(gates-bank-account -55)

(define torvalds-bank-account (make-bank-account 100))
(torvalds-bank-account -70)
(torvalds-bank-account 300)



; (load "l8.scm")
