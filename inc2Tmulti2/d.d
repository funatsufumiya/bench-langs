import std.stdio;
import std.parallelism;
import std.range;

immutable int cores=4;
int maxsum=2000000000;

void main(){
	maxsum/=cores;
	int maxsum=maxsum;

	int sum=0;
	foreach(n;parallel(cores.iota.array)){
		int esum=0;
		for(int i=0;i<maxsum;i++){
			esum++;
		}
		sum+=esum;
	}
	writeln(sum);
}
