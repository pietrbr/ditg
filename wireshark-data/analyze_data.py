import pyshark
import os
import statistics
import numpy as np
dir_path = r'/home/matteo/Documents/ditg/wireshark-data/'
# list to store files
res = []
summ=0
n=0
pckts_size=[]
# Iterate directory
for file in os.listdir(dir_path):
    # check only text files
    if file.endswith('.pcapng'):
        cap = pyshark.FileCapture(file)
        print(file)
        for pckt in cap:
            if("TCP" in str(pckt.layers)):
                #summ=summ+int(pckt.tcp.len)
                #n=n+1
                pckts_size.append(int(pckt.tcp.len))
print(sum(pckts_size)/len(pckts_size))
#print(summ/n)
print("Standard Deviation of sample is % s "
                % (statistics.stdev(pckts_size)))
print("Variance: % s" %(np.var(pckts_size)))