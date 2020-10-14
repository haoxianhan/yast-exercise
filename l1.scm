; 使用Scheme解释器计算下列式子：

; 1.(1+39) * (53-45)
; 2.(1020 / 39) + (45 * 2)
; 3.求和：39, 48, 72, 23, 91
; 4.求平均值：39, 48, 72, 23, 91（结果取为浮点数）

(* (+ 1 39) (- 53 45))

(+ (/ 1020 39) (* 45 2))

(+ 39 48 72 23 91)

(exact->inexact (/ (+ 39 48 72 23 91) 5))


; 使用Scheme解释器求解下列式子：

; 1.圆周率π。
; 2.exp(2/3)。
; 3.3的4次幂。
; 4.1000的对数

;(* 4 (atan 1.0))

(exp (/ 2 3))

(expt 3 4)

(log 1000)
