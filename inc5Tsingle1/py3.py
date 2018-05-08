cores=4
maxsum=5000000000
maxsum=int(maxsum/cores)

if __name__=="__main__":
	sum=0
	for n in range(0,cores):
		esum=0
		for i in range(0,maxsum):
			esum+=1
		sum+=esum
	print(sum)
