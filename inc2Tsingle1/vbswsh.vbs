Const cores=4
Dim maxsum:maxsum=2000000000
maxsum=maxsum\cores

Dim sum:sum=0
Dim esum
For n=1 To cores
	esum=0
	For i=1 To maxsum
		esum=esum+1
	Next
	sum=sum+esum
Next
WScript.Echo sum
