#!/usr/bin/env python3

# Challenge 113
#
# TASK #1 - Represent Integer
# Submitted by: Mohammad S Anwar
# You are given a positive integer $N and a digit $D.
#
# Write a script to check if $N can be represented as a sum of positive
# integers having $D at least once. If check passes print 1 otherwise 0.
#
# Example
# Input: $N = 25, $D = 7
# Output: 0 as there are 2 numbers between 1 and 25 having the digit 7
# i.e. 7 and 17. If we add up both we don't get 25.
#
# Input: $N = 24, $D = 7
# Output: 1

import sys
import re
from itertools import combinations

def nums_containing(n, d):
    nums = list(filter(lambda x: re.search(str(d), str(x)), range(n+1)))
    return nums

def represent(n, d):
    nums = nums_containing(n, d)
    for k in range(1, len(nums)+1):
        for combin in combinations(nums, k):
            if sum(combin) == n:
                return True
    return False

if represent(int(sys.argv[1]), int(sys.argv[2])):
    print(1)
else:
    print(0)
