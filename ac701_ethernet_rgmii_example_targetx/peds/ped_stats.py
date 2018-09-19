#name: Kevin Oshiro
#date: 7/18/16
#description: 
#read data.dat_asic_all.txt generated from tx_ethparse1.cpp and calculate various things

import numpy as np
import matplotlib.pyplot as plt
import csv
import time

##read number out of line with whitespace delimiter
#def findval(line, n):
#    c = 0
#    en = 0
#    t = ''
#    for j in range(len(line)):
#        i = line[j]
#        if c == n or en:
#            en = 1 #start reading
#            t += i
#        #count white space
#        if i in [' ', '\t'] or j == len(line)-1:
#            c += 1
#            if en == 1: #done
#                return int(t[:len(t)-1])
#

##reads parsed pedestal values (technically raw data)
##returns array of (channel number) x (sample number) x (events)
#def ped_read(file):
#	#reads parsed pedestal values (technically raw data)
#	#returns array of (channel number) x (sample number) x (events)
#	with open(file) as f:
#		d = np.zeros((ch_num, samp, events))
#		sample = 0; count = 0
#		for line in f:
#			if line != '\n': #ignore blank lines
#				if sample < 128:
#					for i in range(ch_num):
#						d[i][sample][count] = findval(line, 5+i)+3400 #save interesting value
#				sample += 1 #increment sample
#				if sample == 146: #ignore extra lines in file
#					sample = 0
#					count += 1 #out of navg
#	return d
 
#read parsed pedestal values, way quicker to use csvreader
#return array of (channel number) x (sample number) x (events)
def ped_read(file, ch_num=16, samp=128, events=128):
    d = np.zeros((ch_num, samp, events))
    with open(file, 'rb') as csvfile:
        data = csv.reader(csvfile, delimiter='\t')
        sample = 0; event = 0;
        for row in data:
            if row != []:
                if sample < 128:
                    for ch in range(ch_num):
                        d[ch][sample][event] = int(row[5+ch])+3400
                sample += 1
                if sample == 146:
                    sample = 0
                    event += 1
    return d

#read parsed values from old firmware/parser    
def ped_read_old(file, ch_num=16, samp=128, events=128):
    d = np.zeros((ch_num, samp, events))
    with open(file, 'rb') as csvfile:
        data = csv.reader(csvfile, delimiter=',')
        sample = 0; event = 0;
        for row in data:
            if row != []:
                if sample < 128:
                    for ch in range(ch_num):
                        d[ch][sample][event] = int(row[ch+4])
                sample += 1
                if sample == 130:
                    sample = 0
                    event += 1
    return d
    
#E[x-m]
def avg_dev(events):
    mm = np.mean(events)
    nn = 0
    for i in range(len(events)):
        nn += np.abs(events[i]-mm)
    return nn/len(events)
    
#calculate stats for each channel and sample
#returns array of (channel number) x (sample number)
def ped_var(d):
     return np.array([[np.var(d[i][j]) for j in range(samp)] for i in range(ch_num)])
def ped_std(d):
     return np.array([[np.std(d[i][j]) for j in range(samp)] for i in range(ch_num)])	
def ped_mean(d):
     return np.array([[np.mean(d[i][j]) for j in range(samp)] for i in range(ch_num)])
def ped_avgd(d):
     return np.array([[avg_dev(d[i][j]) for j in range(samp)] for i in range(ch_num)])
def ped_max(d):
     return np.array([[np.max(d[i][j]) for j in range(samp)] for i in range(ch_num)])
def ped_min(d):
     return np.array([[np.min(d[i][j]) for j in range(samp)] for i in range(ch_num)])
     
def onelineplot(x, y, title='', xlabel='', ylabel=''):
    plt.plot(x, y)
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)

def onelinehist(y, bins=30, title='', xlabel='', ylabel=''):
    plt.hist(y, bins=bins)
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    
#plot overlayed events (multiple events from same 4 windows)
def overlay(d, ch_st, ch_end, title='Overlayed events', events=128):
    e = np.array([d[i].transpose() for i in range(ch_num)])
    for ch in range(ch_st, ch_end+1):
        for ev in range(events):
            onelineplot(range(samp), e[ch][ev], title+', ch'+str(ch), 'sample', 'ADC count')
        plt.show()


###################################################################################

ch_num = 16
samp = 128 #4*32
events = 128 #2**7

file = 'C:/Users/Kevin/Desktop/KO/ac701_ethernet_rgmii_example_targetx/peds/data_win90_ped'
file_old = 'C:/Users/Kevin/Desktop/KO/ac701_ethernet_rgmii_example_targetx/peds/data90.dat.txt'
pedrange = ['4000', '6000', '8000', 'a000', 'c000', 'e000', 'ffff']
#pedrange = ['ffff']
ext = '.dat_asic_all.txt'

ch_st = 1 #channel numbers to plot
ch_end = 1

avgavgd = [[] for ch in range(ch_num)]
for pedval in pedrange:
    d = ped_read(file+pedval+ext) #read and calculate
    pmean = ped_mean(d)
    pavgd = ped_avgd(d)
#
    overlay(d, ch_st, ch_end, 'Overlayed events, '+pedval)
#
    for ch in range(ch_st, ch_end+1):
##       onelineplot(range(samp), pmean[ch], 'ch'+str(ch)+', '+pedval, 'sample', 'mean')
##       plt.show()
       onelineplot(range(samp), pavgd[ch], 'ch'+str(ch)+', '+pedval, 'sample', 'avgd')
       plt.show()
#       
       avgavgd[ch].append(np.mean(pavgd[ch]))
#
#for ch in range(ch_st, ch_end+1):
#    onelineplot([2.5*i for i in np.arange(0.25, 1.125, 0.125)], avgavgd[ch], 'vped', 'channel avg dev')
#
#    #histogram of pedestal values for all events from 4 windows
#    h = [[] for i in range(ch_num)]
#    for ch in range(ch_st, ch_end+1):
#        for sa in range(samp):
#            h[ch] = np.array(list(h[ch])+list(d[ch][sa]))
#        onelinehist(h[ch], 30, 'ch'+str(ch)+', '+pedval, 'ADC count', 'count')
#        plt.show()
