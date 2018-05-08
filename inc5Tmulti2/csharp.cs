using System;
using System.Threading.Tasks;

static class Program{
	const int cores=4;
	static long maxsum=5000000000;

	static void Main(){
		maxsum/=cores;

		long sum=0;
		Parallel.For(0,cores,(n)=>{
			long esum=0;
			for(long i=0;i<maxsum;i++){
				esum++;
			}
			sum+=esum;
		});
		Console.WriteLine(sum);
	}
}
