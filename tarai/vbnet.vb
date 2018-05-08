Option Strict On

Module Program
	Function tarai(x As Integer,y As Integer,z As Integer) As Integer
		If x<=y Then tarai=y _
		Else tarai=tarai(tarai(x-1,y,z),tarai(y-1,z,x),tarai(z-1,x,y))
	End Function

	Sub Main
		Console.WriteLine(tarai(12,6,0))
	End Sub
End Module
