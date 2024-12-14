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