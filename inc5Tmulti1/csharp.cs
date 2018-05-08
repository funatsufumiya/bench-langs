using System;
using System.Threading.Tasks;

static class Program{
	const int cores=4;
	static long maxsum=5000000000;

	static void Main(){
		maxsum/=cores;

		long sum=0;
		var myTasks=Array.ConvertAll(new object[cores],n=>Task.Run(()=>{
			long esum=0;
			for(long i=0;i<maxsum;i++){
				esum++;
			}
			sum+=esum;
		}));
		Task.WaitAll(myTasks);
		Console.WriteLine(sum);
	}
}
