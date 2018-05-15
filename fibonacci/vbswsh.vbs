Function fib(n)
	If n<2 Then fib=n _
	Else fib=fib(n-1)+fib(n-2)
End Function

WScript.Echo fib(40)
