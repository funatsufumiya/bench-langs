(def cores 4)
(def maxsum 2000000000)
(def maxsum (/ maxsum cores))

(let [sum (reduce + (for[n (range cores)]
		(reduce + (for[i (range maxsum)]
			1
		))
	))]
	(println sum)
)
