Option Strict On

Imports System.Threading.Tasks

Module Program
	Const cores=4
	Dim maxsum As Integer=2000000000

	Sub Main
		maxsum\=cores

		Dim sum=0
		Dim myTasks=Array.ConvertAll(New Object(cores-1){},Function(n)Task.Run(Sub()
			Dim esum=0
			For i=1 To maxsum
				esum+=1
			Next
			sum+=esum
		End Sub))
		Task.WaitAll(myTasks)
		Console.WriteLine(sum)
	End Sub
End Module
