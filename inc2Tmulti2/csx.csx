const int cores=4;
int maxsum=2000000000;
maxsum/=cores;

int sum=0;
Parallel.For(0,cores,(n)=>{
	int esum=0;
	for(int i=0;i<maxsum;i++){
		esum++;
	}
	sum+=esum;
});
WriteLine(sum);
