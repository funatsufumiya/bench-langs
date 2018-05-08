import std.stdio;

immutable int cores=4;
int maxsum=2000000000;

void main(){
	maxsum/=cores;
	int maxsum=maxsum;

	int sum=0;
	for(int n=0;n<cores;n++){
		int esum=0;
		for(int i=0;i<maxsum;i++){
			esum++;
		}
		sum+=esum;
	}
	writeln(sum);
}
