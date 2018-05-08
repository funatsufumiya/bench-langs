"use strict";

const cluster=require("cluster");

const cores=4;
var maxsum=2000000000;

if(cluster.isWorker){
	maxsum=0|process.argv[2];
	var esum=0;
	for(var i=0;i<maxsum;i=0|i+1){
		esum=0|esum+1;
	}
	process.send(esum);
	process.exit();
}

maxsum/=cores;
var sum=0;
const myWorkers=Array(cores).fill().map(n=>new Promise(resolve=>{
	cluster.setupMaster({args:[maxsum]});
	cluster.fork().once("message",esum=>{
		sum=0|sum+esum;
		return resolve();
	});
}));
Promise.all(myWorkers).then(()=>{
	console.log(sum);
});
