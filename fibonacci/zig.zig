// cpp
// #include<iostream>
// using namespace std;

// int fib(int n){
// 	if(n<2) return n;
// 	else return fib(n-1)+fib(n-2);
// }

// int main(){
// 	cout<<fib(40)<<endl;
// 	return 0;
// }


// zig

const std = @import("std");
const math = @import("math");

fn fib(n: i32) i32 {
	if (n < 2) {
		return n;
	} else {
		return fib(n - 1) + fib(n - 2);
	}
}

pub fn main() void {
	const result = fib(40);
	std.debug.print("{}", .{result});
}