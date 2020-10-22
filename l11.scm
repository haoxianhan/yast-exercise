; 练习1
; 编写一个用于计算两向量内积的函数。
(define (vertor-inner-product v1 v2)
  (let ((lenv1 (vector-length v1))
        (lenv2 (vector-length v2)))
    (if (= lenv1 lenv2)
      (let loop ((i 0) (acc 0))
        (if (= i lenv1)
          acc
          (loop (+ i 1) (+ acc (* (vector-ref v1 i)
                                  (vector-ref v2 i)))))))))



(vertor-inner-product '#(1 2) '#(3 4))


; (load "l11.scm")
