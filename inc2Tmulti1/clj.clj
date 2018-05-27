(def cores 4)
(def maxsum 2000000000)
(def maxsum (/ maxsum cores))

(let [
	sum (atom 0)
	myFutures (for[i (range cores)]
		(future
			(reduce + (for[i (range maxsum)]
				1
			))
		)
	)
]
	(reset! sum (reduce + (for[v myFutures] @v)))
	(println @sum)
	(shutdown-agents)
)
