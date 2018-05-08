Option Strict On

Module Program
	Const cores=4
	Dim maxsum As Integer=2000000000

	Sub Main
		maxsum\=cores

		Dim sum=0
		For n=1 To cores
			Dim esum=0
			For i=1 To maxsum
				esum+=1
			Next
			sum+=esum
		Next
		Console.WriteLine(sum)
	End Sub
End Module
