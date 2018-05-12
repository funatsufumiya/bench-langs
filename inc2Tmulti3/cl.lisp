(defparameter cores 4)
(defparameter maxsum 2000000000)
(setf maxsum (/ maxsum cores))

(let ((sum 0) myThreads)
	(setf myThreads (loop for n from 0 below cores collect
		(sb-thread:make-thread (lambda()(let ((esum 0))
			(do((i 0 (1+ i))) ((<= maxsum i))
				(incf esum)
			)
			esum
		)))
	))
	(setf sum (loop for v in myThreads sum (sb-thread:join-thread v)))
	(format t "~d~%" sum)
)
