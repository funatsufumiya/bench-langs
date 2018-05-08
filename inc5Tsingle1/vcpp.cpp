#include<iostream>
#include<cstdint>
using namespace std;

const int cores=4;
int64_t maxsum=5000000000;

int main(){
	maxsum/=cores;

	int64_t sum=0;
	for(int n=0;n<cores;n++){
		int64_t esum=0;
		for(int64_t i=0;i<maxsum;i++){
			esum++;
		}
		sum+=esum;
	}
	cout<<sum<<endl;
}
