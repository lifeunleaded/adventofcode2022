#!/usr/bin/env python3
calories=open('day1_input','r').read()
def sumcals(string):
    return sum(list(map(int,string.split('\n'))))

print(max(list(map(sumcals,calories.split('\n\n')))))
