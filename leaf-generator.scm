(define (leaf-generator tree)
  (let ((return '()))
    (letrec ((continue
               (lambda ()
                 (let rec ((tree tree))
                   (cond
                     ((null? tree) 'skip)
                     ((pair? tree) (rec (car tree)) (rec (cdr tree)))
                     (else
                       (call/cc (lambda (lap-to-go)
                                  (set! continue (lambda () (lap-to-go 'restart)))
                                  (return tree))))))
                 (return '()))))
      (lambda ()
        (call/cc (lambda (where-to-go)
                   (set! return where-to-go)
                   (continue)))))))


