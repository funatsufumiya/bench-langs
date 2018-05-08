Option Strict On

Module Program
	Const cores=1
	Dim maxsum As Long=5000000000

	Sub Main
		maxsum\=cores

		Dim sum=0L
		For n=1 To cores
			Dim esum=0L
			For i=1L To maxsum
				esum+=1
			Next
			sum+=esum
		Next
		Console.WriteLine(sum)
	End Sub
End Module
