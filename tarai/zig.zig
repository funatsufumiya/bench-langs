const std = @import("std");

fn tarai(x: i32, y: i32, z: i32) i32 {
	if (x <= y) {
		return y;
	} else {
		return tarai(
			tarai(x - 1, y, z),
			tarai(y - 1, z, x),
			tarai(z - 1, x, y),
		);
	}
}

pub fn main() void {
	const result = tarai(12, 6, 0);
	std.debug.print("{}", .{result});
}