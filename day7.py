#!/usr/bin/env python3
indatafile = open('day7_input')
indata = indatafile.readlines()
indatafile.close()
dirs = {'/':{'files':[],'dirs':[],'size':0,'parent':'/'}}
parents = {'/':''}
sizes = {'/':0}

thisdir = '/'
parentdir = '/'
for line in indata:
    if line.strip() == '$ cd ..':
        thisdir = parentdir
        parentdir = parents[thisdir]
    elif line[0:4] == '$ cd':
        parentdir = thisdir
        thisdir = parentdir+'/'+line[4:].strip()
        if thisdir not in dirs.keys():
            dirs[thisdir] = {'files':[],'dirs':[],'size':0}
            parents[thisdir] = parentdir
        if thisdir not in sizes.keys():
            sizes[thisdir] = 0
    elif line[0:3] == 'dir':
        parents[line[4:].strip()] = thisdir
        dirs[thisdir]['dirs'].append(line[4:].strip())
    elif line.split()[0].isnumeric():
        dirs[thisdir]['files'].append(line.split()[1].strip())
        dirs[thisdir]['size'] += int(line.split()[0])
        countupdir = thisdir
        while countupdir != '/':
            sizes[countupdir] += int(line.split()[0])
            countupdir = parents[countupdir]
        sizes['/']+= int(line.split()[0])
    else:
        pass

totalspace = 70000000
neededspace = 30000000
usedspace = sizes['/']
availablespace = totalspace - usedspace
missingspace = neededspace - availablespace
sizelist = [sizes[x] for x in sizes.keys()]
print(sum(filter(lambda size: size <= 100000, sizelist))) #part 1
print(min(filter(lambda size: size >= missingspace, sizelist))) #part 2