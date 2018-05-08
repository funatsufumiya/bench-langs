#include<iostream>
using namespace std;

const int cores=4;
int maxsum=2000000000;

int main(){
	maxsum/=cores;

	int sum=0;
	for(int n=0;n<cores;n++){
		int esum=0;
		for(int i=0;i<maxsum;i++){
			esum++;
		}
		sum+=esum;
	}
	cout<<sum<<endl;
}
