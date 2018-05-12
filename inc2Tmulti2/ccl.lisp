(defparameter cores 4)
(defparameter maxsum 2000000000)
(setf maxsum (/ maxsum cores))

(let ((sum 0) myProcesses)
	(setf myProcesses (loop for n from 0 below cores collect
		(process-run-function t (lambda()(let ((esum 0))
			(loop for i from 0 below maxsum do
				(incf esum)
			)
			esum
		)))
	))
	(setf sum (loop for v in myProcesses sum (join-process v)))
	(format t "~d~%" sum)
)
(quit)
