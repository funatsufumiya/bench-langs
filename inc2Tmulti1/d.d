import std.stdio;
import core.thread;

immutable int cores=4;
int maxsum=2000000000;

void main(){
	maxsum/=cores;
	int maxsum=maxsum;

	int sum=0;
	auto myThreads=new ThreadGroup();

	for(int n;n<cores;n++){
		auto t=new Thread(delegate(){
			int esum=0;
			for(int i=0;i<maxsum;i++){
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
