(def cores 4)
(def maxsum 5000000000)
(def maxsum (/ maxsum cores))

(let [
	sum (atom 0)
	esum (pmap (fn[i]
		(reduce + (for[i (range maxsum)]
			1
		))
	) (range cores))
]
	(reset! sum (reduce + esum))
	(println @sum)
	(shutdown-agents)
)
