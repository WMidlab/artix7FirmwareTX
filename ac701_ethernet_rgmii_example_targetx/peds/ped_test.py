#test standard deviation approximation algorithms for pedestals
#and mean deviation approximations

import numpy as np
import matplotlib.pyplot as plt

mean_err = []
std3_err = []
avgd_err = []
avgd2_err = []
N = 1 #5000
for i in range(N):
    
    n = 7
    pednum = 2**n
    
    #sigma = np.random.randint(50)
    #mu = np.random.randint(3000)
    
    sigma = 20
    mu = 1400
    ped = [np.round(j) for j in sigma*np.random.randn(pednum)+mu] #generate pedestals
    #ped = np.random.uniform(1200, 1600, pednum)
    
    s = np.zeros(pednum)
    s_sq = np.zeros(pednum)
    m_i = np.zeros(pednum)
    var_i = np.zeros(pednum)
    d_sq = np.zeros(pednum)
    m = np.zeros(pednum)
    dev_sum = np.zeros(pednum)
    dev_sum1 = np.zeros(pednum)
    dev_sum2 = np.zeros(pednum)
    ma = np.zeros(pednum)
    for j in range(pednum):

        #actual standard deviation
        if j == 0:
            s[0] = ped[0]
            s_sq[0] = ped[0]**2
        else:
            s[j] = s[j-1] + ped[j] #sum
            s_sq[j] = s_sq[j-1] + ped[j]**2 #squared sum
        
        #standard deviation approximation
        if j == 0:
            m[0] = s[0]
        if j > 0:
            m[j] = s[j]/(j+1) #current mean
            d_sq[j] = d_sq[j-1] + (ped[j] - m[j-1])**2 #squared difference sum
        
        #average deviation approximation
        if j > 0:
            dev_sum1[j] = dev_sum1[j-1] + np.abs(ped[j]-m[j-1])
            
        #average deviation approximation with division by powers of 2
        if np.mod(np.log2(j), 1) == 0: #calculate mean every power of 2
            ma[j] = s[j-1] / (j);
            if j == 2:
                print 'j = ', j
                print 's[j-1] = ', s[j-1]
                print 'ma[j] = ', ma[j]
        else:
            ma[j] = ma[j-1]
        if j > 0: #calculate average deviation approximation
             dev_sum2[j] = dev_sum2[j-1] + np.abs(ped[j]-ma[j])
        
        
    
    var1 = s_sq[-1]/pednum - (s[-1]/pednum)**2 #exact
    std1 = np.sqrt(var1)
    
    var3 = d_sq[-1]/pednum
    std3 = np.sqrt(var3)
    
    #actual average difference
    for j in range(pednum):
            dev_sum[j] = dev_sum[j-1] + np.abs(ped[j]-m[-1])
    
    avgd = dev_sum[-1]/pednum
    
    avgd1 = dev_sum1[-1]/pednum  
    
    avgd2 = dev_sum2[-1]/pednum
    
    if std1 != 0: #calculate error
        std3_err.append(np.abs(std1 - std3)/std1)
    
    if avgd != 0:
        avgd_err.append(np.abs(avgd-avgd1)/avgd)
        
    if avgd2 != 0:
        avgd2_err.append(np.abs(avgd-avgd2)/avgd)
        
    
#    s_sq_max.append(s_sq[-1]/pednum)
#    s_sq_min.append(s_sq[0]/pednum)
#    d_sq_max.append(d_sq[-1]/pednum)
#    d_sq_min.append(d_sq[0]/pednum)

#plt.hist(std_err, bins=30)   # previous approx
plt.hist([100*i for i in std3_err],bins=30)     # new approx
plt.title('standard deviation error')
plt.xlabel('percent error')
plt.ylabel('number of times')
plt.show()
plt.hist([100*i for i in avgd2_err],bins=30)
plt.title('average deviation error, only divide by 2**n')
plt.xlabel('percent error')
plt.ylabel('number of times')
plt.show()

#plt.hist(std4_err,bins=30)
#plt.show()

#not actually helpful
#print '\nExact Calculation'
#print 'Max largest stored value: ', np.max(s_sq_max), '(', np.log2(np.max(s_sq_max)), ' bits)'
#print 'Min smallest stored value: ', np.min(s_sq_min), '(', np.log2(np.min(s_sq_min)), ' bits)'
#print 'Average largest stored value: ', np.mean(s_sq_max), '(', np.log2(np.mean(s_sq_max)), ' bits)'
#print '\nApproximation'
#print 'Max largest stored value: ', np.max(d_sq_max), '(', np.log2(np.max(d_sq_max)), ' bits)'
#print 'Min smallest stored value: ', np.min(d_sq_min), '(', np.log2(np.min(d_sq_min)), ' bits)'
#print 'Average largest stored value: ', np.mean(d_sq_max), '(', np.log2(np.mean(d_sq_max)), ' bits)'






