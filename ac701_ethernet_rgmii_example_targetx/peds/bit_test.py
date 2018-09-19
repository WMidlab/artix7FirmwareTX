#test accuracy for range of pedestals with limited bits     

low = 1200
high = 1600
bits = 8
tbits = int(np.ceil(np.log2(high)))
dbits = tbits-bits
div = 2**dbits
navg = 7
pednum = 2**navg
sigma = 200
mu = 1400
N = 1


for i in range(N):
    #generate some values in binary
    #p = [int(j) for j in np.random.uniform(low, high, pednum)]
    p = [np.round(j) for j in sigma*np.random.randn(pednum)+mu]

    #pb = [bin(j)[2:] for j in p]
    #vb = ['0'*(tbits-len(i))+i for i in pb]

    #round to nearest 2^div
    r = [div*np.round(j/div) for j in p]

    #calculate mean and variance
    s=0; d=0
    for j in range(pednum):
        s += p[j]
        d += (p[j]-s/(j+1))**2
    
    m = s/pednum
    v = d/pednum
    
    
    #calculate error from removing LSBs