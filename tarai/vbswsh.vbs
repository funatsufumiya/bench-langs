Function tarai(x,y,z)
	If x<=y Then tarai=y _
	Else tarai=tarai(tarai(x-1,y,z),tarai(y-1,z,x),tarai(z-1,x,y))
End Function

WScript.Echo tarai(12,6,0)
