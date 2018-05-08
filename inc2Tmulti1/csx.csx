const int cores=4;
int maxsum=2000000000;
maxsum/=cores;

int sum=0;
var myTasks=Array.ConvertAll(new object[cores],n=>Task.Run(()=>{
	int esum=0;
	for(int i=0;i<maxsum;i++){
		esum++;
	}
	sum+=esum;
}));
Task.WaitAll(myTasks);
WriteLine(sum);
