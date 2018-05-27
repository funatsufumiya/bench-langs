(def cores 4)
(def maxsum 5000000000)
(def maxsum (/ maxsum cores))

(let [sum (atom 0)]
	(dotimes[n cores] (let [esum (atom 0)]
		(dotimes[i maxsum]
			(swap! esum inc)
		)
		(reset! sum (+ @sum @esum))
	))
	(println @sum)
)
