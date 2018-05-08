"use strict";

const cores=4;
var maxsum=5000000000;
maxsum/=cores;

var sum=0;
const myPromises=Array(cores).fill().map(n=>new Promise(resolve=>{
	var esum=0;
	for(var i=0;i<maxsum;i++){
		esum++;
	}
	sum+=esum;
	resolve();
}));
Promise.all(myPromises).then(()=>{
	console.log(sum);
});
