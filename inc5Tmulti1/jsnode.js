"use strict";

const cluster=require("cluster");

const cores=4;
var maxsum=5000000000;

if(cluster.isWorker){
	maxsum=+process.argv[2];
	var esum=0;
	for(var i=0;i<maxsum;i++){
		esum++;
	}
	process.send(esum);
	process.exit();
}

maxsum/=cores;

var sum=0;
const myWorkers=Array(cores).fill().map(n=>new Promise(resolve=>{
	cluster.setupMaster({args:[maxsum]});
	cluster.fork().once("message",esum=>{
		sum=sum+esum;
		return resolve();
	});
}));
Promise.all(myWorkers).then(()=>{
	console.log(sum);
});
