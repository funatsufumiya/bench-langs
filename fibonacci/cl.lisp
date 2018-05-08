(defun fib(n)
	(if(< n 2)
		n
		(+(fib(1- n)) (fib(- n 2)))
	)
)

(format t "~d~%" (fib 40))
