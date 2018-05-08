function tarai(x,y,z){
	if(x<=y) return y;
	else return tarai(tarai(0|x-1,y,z),tarai(0|y-1,z,x),tarai(0|z-1,x,y));
}

WScript.Echo(tarai(12,6,0));
