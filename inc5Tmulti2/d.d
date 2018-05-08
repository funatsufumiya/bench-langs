import std.stdio;
import std.parallelism;
import std.range;

immutable int cores=4;
long maxsum=5000000000;

void main(){
	maxsum/=cores;
	long maxsum=maxsum;

	long sum=0;
	foreach(n;parallel(cores.iota.array)){
		long esum=0;
		for(long i=0;i<maxsum;i++){
			esum++;
		}
		sum+=esum;
	}
	writeln(sum);
}
