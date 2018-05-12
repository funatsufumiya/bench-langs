(defparameter cores 4)
(defparameter maxsum 2000000000)
(setf maxsum (/ maxsum cores))

(let ((sum 0))
	(loop for n from 0 below cores do (let ((esum 0))
		(loop for i from 0 below maxsum do
			(incf esum)
		)
		(incf sum esum)
	))
	(format t "~d~%" sum)
)
