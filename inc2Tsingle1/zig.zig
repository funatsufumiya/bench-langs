const std = @import("std");
const cores: usize = 4;
var maxsum: usize = 2000000000;

pub fn main() void {
    maxsum = @divTrunc(maxsum, cores);

	var sum: usize = 0;
	for (cores) |_| {
		var esum: usize = 0;
		for (maxsum) |_| {
			esum += 1;
		}
		sum += esum;
	}
	std.debug.print("{}", .{sum});
}