using System;
using System.Threading.Tasks;

static class Program{
	const int cores=4;
	static int maxsum=2000000000;

	static void Main(){
		maxsum/=cores;

		int sum=0;
		Parallel.For(0,cores,(n)=>{
			int esum=0;
			for(int i=0;i<maxsum;i++){
				esum++;
			}
			sum+=esum;
		});
		Console.WriteLine(sum);
	}
}
