Option Strict On

Imports System.Threading.Tasks

Module Program
	Const cores=4
	Dim maxsum As Integer=2000000000

	Sub Main
		maxsum\=cores

		Dim sum=0
		Parallel.For(0,cores,Sub(n)
			Dim esum=0
			For i=1 To maxsum
				esum+=1
			Next
			sum+=esum
		End Sub)
		Console.WriteLine(sum)
	End Sub
End Module
