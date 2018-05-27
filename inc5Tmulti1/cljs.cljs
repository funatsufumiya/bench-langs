(def cluster (js/require "cluster"))

(def cores 4)
(def maxsum 5000000000)
(def maxsum (/ maxsum cores))

(when cluster.isWorker
	(let [esum (atom 0)]
		(dotimes(i maxsum)
			(swap! esum inc)
		)
		(process.send @esum)
		(process.exit)
	)
)

(let [sum (atom 0)]
(let [myWorkers (for[n (range cores)](js/Promise. (fn[resolve]
	(-> (cluster.fork) (.once "message" (fn[esum]
		(reset! sum (+ @sum esum))
		(resolve)
	)))
)))]
	(-> (Promise.all myWorkers) (.then (fn[]
		(println @sum)
	)))
))

