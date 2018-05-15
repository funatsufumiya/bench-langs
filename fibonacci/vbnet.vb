Option Strict On

Module Program
	Function fib(n As Integer) As Integer
		If n<2 Then fib=n _
		Else fib=fib(n-1)+fib(n-2)
	End Function

	Sub Main
		Console.WriteLine(fib(40))
	End Sub
End Module
