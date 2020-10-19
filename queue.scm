(define (make-queue)
  (cons '() '()))

(define (enqueue! queue obj)
  (let ((lobj (cons obj '())))
    (if (null? (car queue))
      (begin
        (set-car! queue lobj)
        (set-cdr! queue lobj))
      (begin
        ;  queue的结构一直是  ((a1 a2 ... lobj) lobj)  每次都是同时修改了指向lobj的两个值
        (set-cdr! (cdr queue) lobj)
        (set-cdr! queue lobj)
        ))
    (car queue)))

(define (dequeue! queue)
  (let ((obj (car (car queue))))
    (set-car! queue (cdr (car queue)))
    obj))

(define q (make-queue))

q
; (enqueue! q 'a)
; (enqueue! q 'b)
; (enqueue! q 'c)
; (load "queue.scm")

; sample1
(define (make-test val)
  (cons val val))

(define (make-modify t val)
  (set-car! t val))

(define t (make-test 10))

(make-modify t 20)


; sample2
(define (make-test1)
  (cons '() '()))

(define (make-modify1 t val)
  (if (null? (car t))
    (begin (set-car! t val)
           (set-cdr! t val))
    (set-car! t val)))

(define t1 (make-test1))

(make-modify1 t1 20)

; sample1 和 sample2 可以对比到 val 的引用
