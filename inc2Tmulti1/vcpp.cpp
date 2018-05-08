#include<iostream>
#include<vector>
#include<future>
using namespace std;

const int cores=4;
int maxsum=2000000000;

int main(){
	maxsum/=cores;

	int sum=0;
	vector<future<void>> myFutures;
	for(int n=0;n<cores;n++){
		myFutures.push_back(async(launch::async,[&]{
			int esum=0;
			for(int i=0;i<maxsum;i++){
				esum++;
			}
			sum+=esum;
		}));
	}
	for(auto &t:myFutures) t.wait();
	cout<<sum<<endl;
}
