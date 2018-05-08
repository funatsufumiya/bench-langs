import std.stdio;

immutable int cores=4;
long maxsum=5000000000;

void main(){
	maxsum/=cores;
	long maxsum=maxsum;

	long sum=0;
	for(int n=0;n<cores;n++){
		long esum=0;
		for(long i=0;i<maxsum;i++){
			esum++;
		}
		sum+=esum;
	}
	writeln(sum);
}
