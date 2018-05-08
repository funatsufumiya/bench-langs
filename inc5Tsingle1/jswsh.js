var cores=4;
var maxsum=5000000000;
maxsum/=cores;

var sum=0;
for(var n=0;n<cores;n=0|n+1){
	var esum=0;
	for(var i=0;i<maxsum;i++){
		esum++;
	}
	sum+=esum;
}
WScript.Echo(sum);
