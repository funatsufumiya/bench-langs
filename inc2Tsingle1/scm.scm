(define cores 4)
(define maxsum 2000000000)
(set! maxsum (/ maxsum cores))

(let ((sum 0))
	(do((n 0 (+ 1 n))) ((<= cores n)) (let ((esum 0))
		(do((i 0 (+ 1 i))) ((<= maxsum i))
			(set! esum (+ 1 esum))
		)
		(set! sum (+ sum esum))
	))
	(display sum)(newline)
)
