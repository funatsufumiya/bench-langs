import std.stdio;
import core.thread;

immutable int cores=4;
long maxsum=5000000000;

void main(){
	maxsum/=cast(long)cores;
	long maxsum=maxsum;

	long sum=0;
	auto myThreads=new ThreadGroup();

	for(int n;n<cores;n++){
		auto t=new Thread(delegate(){
			long esum=0;
			for(long i=0;i<maxsum;i++){
				esum++;
			}
			sum+=esum;
		});
		myThreads.add(t);
		t.start();
	}
	myThreads.joinAll();
	writeln(sum);
}
