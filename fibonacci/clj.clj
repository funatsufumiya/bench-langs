(defn fib[n]
	(if(< n 2)
		n
		(+(fib(dec n)) (fib(- n 2)))
	)
)

(println (fib 40))
