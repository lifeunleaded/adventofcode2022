#!/usr/bin/env python3

calories=open('day1_input','r').read()
def sumcals(string):
    return sum(list(map(int,string.split('\n'))))
elves=list(map(sumcals,calories.split('\n\n')))
elves.sort(reverse=True)
print(sum(elves[0:3]))
