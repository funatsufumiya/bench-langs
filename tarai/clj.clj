(defn tarai[x y z]
	(if(<= x y)
		y
		(tarai(tarai (dec x) y z) (tarai (dec y) z x) (tarai (dec z) x y))
	)
)

(println (tarai 12 6 0))
