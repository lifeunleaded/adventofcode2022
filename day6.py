#!/usr/bin/env python3
indatafile = open('day6_input')
indata = indatafile.read()
indatafile.close()
numchars = 0

for i in range(3,len(indata)):
    if len(set(indata[i-3:i+1])) == len(indata[i-3:i+1]):
        print(i+1)
        break
