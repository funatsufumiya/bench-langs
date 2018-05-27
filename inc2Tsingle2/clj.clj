(def cores 4)
(def maxsum 2000000000)
(def maxsum (/ maxsum cores))

(let [sum (atom 0)]
	(loop[n 0](when(< n cores)(let [esum (atom 0)]
		(loop[i 0](when(< i maxsum)
			(swap! esum inc)
		(recur(inc i))))
		(reset! sum (+ @sum @esum))
	(recur(inc n)))))
	(println @sum)
)
