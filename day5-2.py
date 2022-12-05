#!/usr/bin/env python3
indatafile = open('day5_input')
indata = indatafile.readlines()
indatafile.close()
numstacks = 0
stacks = {}

for line in indata:
    allnums = True
    for x in line.strip().split():
        try:
            int(x)
        except ValueError:
            allnums = False
        if allnums:
            numstacks = len(line.strip().split())
            break

for i in range(0,numstacks):
    stacks[i] = []

for line in indata:
    if '[' in line:
        for step in range(0,numstacks*4,4):
            stacknum = step // 4
            if line[step] == '[':
                stacks[stacknum].append(line[step+1])
    if line.startswith('move'):
        num = int(line.split()[1])
        fromstack = int(line.split()[3])-1
        tostack = int(line.split()[5])-1
        stacks[tostack] = stacks[fromstack][:num]+stacks[tostack]
        stacks[fromstack] = stacks[fromstack][num:]
res = []
for stack in stacks.keys():
    res.append(stacks[stack][0])

print(''.join(res))
