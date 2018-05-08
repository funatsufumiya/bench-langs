const int cores=4;
long maxsum=5000000000;
maxsum/=cores;

long sum=0;
Parallel.For(0,cores,(n)=>{
	long esum=0;
	for(long i=0;i<maxsum;i++){
		esum++;
	}
	sum+=esum;
});
WriteLine(sum);
