#!/usr/bin/env python3
indatafile = open('day4_input')
indata = indatafile.readlines()
indatafile.close()
def rangetoset(str):
    [start,end] = map(int, str.split('-'))
    return set(range(start,end+1))

def linetosets(str):
    strs = str.rstrip('\n').split(',')
    return list(map(rangetoset,strs))

setpairs = list(map(linetosets, indata))
overlaps = 0
for setpair in setpairs:
    if setpair[0] <= setpair[1] or setpair[1] <= setpair[0]:
        overlaps +=1

print(overlaps)