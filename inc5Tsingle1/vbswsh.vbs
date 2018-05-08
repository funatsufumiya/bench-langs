Const cores=4
Const maxsumDef=5000000000
Dim maxsum:maxsum=maxsumDef
maxsum=maxsum/cores

Dim sum:sum=0
Dim esum
For n=1 To cores
	esum=0
	For i=1 To maxsum
		sum=sum+1
	Next
	sum=sum+esum
Next
WScript.Echo sum
