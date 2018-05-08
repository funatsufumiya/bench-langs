"use strict";

const cores=4;
var maxsum=2000000000;
maxsum/=cores;

var sum=0;
const myPromises=Array(cores).fill().map(n=>new Promise(resolve=>{
	var esum=0;
	for(var i=0;i<maxsum;i=0|i+1){
		esum=0|esum+1;
	}
	sum=0|sum+esum;
	resolve();
}));
Promise.all(myPromises).then(()=>{
	console.log(sum);
});
