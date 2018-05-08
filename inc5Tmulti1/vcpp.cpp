#include<iostream>
#include<cstdint>
#include<vector>
#include<future>
using namespace std;

const int cores=4;
int64_t maxsum=5000000000;

int main(){
	maxsum/=cores;

	int64_t sum=0;
	vector<future<void>> myFutures;
	for(int n=0;n<cores;n++){
		myFutures.push_back(async(launch::async,[&]{
			int64_t esum=0;
			for(int i=0;i<maxsum;i++){
				esum++;
			}
			sum+=esum;
		}));
	}
	for(auto &t:myFutures) t.wait();
	cout<<sum<<endl;
}
