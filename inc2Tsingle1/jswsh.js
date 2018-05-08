var cores=4;
var maxsum=2000000000;
maxsum/=cores;

var sum=0;
for(var n=0;n<cores;n=0|n+1){
	var esum=0;
	for(var i=0;i<maxsum;i=0|i+1){
		esum=0|esum+1;
	}
	sum=0|sum+esum;
}
WScript.Echo(sum);
