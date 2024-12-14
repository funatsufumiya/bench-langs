fn main() {
	let cores = 4;
	let mut maxsum = 2000000000;

	maxsum /= cores;

	let mut sum = 0;
	for _ in 0..cores {
		let mut esum = 0;
		for _ in 0..maxsum {
			esum += 1;
		}
		sum += esum;
	}
	println!("{}", sum);
}