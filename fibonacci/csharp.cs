using System;

class Program{
	static int fib(int n){
		if(n<2) return n;
		else return fib(n-1)+fib(n-2);
	}

	static void Main(){
		Console.WriteLine(fib(40));
	}
}
