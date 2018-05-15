"use strict";

function fib(n){
	if(n<2) return n;
	else return 0|fib(0|n-1)+fib(0|n-2);
}

console.log(fib(40));
