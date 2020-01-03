#점화식으로 피보나치 수열 계산
a = [0]*8 #리스트 초기화
print(a)  #확인

a[0] = 1  #초항값 설정
a[1] = 1  #2항값 설정
print(a)  #확인

for i in range(2,8):  #점화식에서 3~8항의 값 계산
    a[i] = a[i - 1]+ a[i -2]
print(a)

for i in range(0,3):
    print(i)

a = [[ 0 for i in range(0,3)] for j in range(0,4)]
a[2][2] = 2
print(a)


import random
import numpy as np

r = []
for a in range(0,1000):
    r.append(random.random())

print(np.mean(r))
print(np.std(r))

b = np.random.randn(1000)
print(np.mean(b))
print(np.std(b))

import math

def var(data):
    avg = sum(data)/len(data)
    total = 0
    for i in data:
        total += (avg - i) ** 2
    return total / len(data)

def std(data):
    return math.sqrt(var(data))

a = [72, 61, 91, 31, 45]

print(sum(a) / len(a))
print(var(a))
print(std(a))


import numpy as np

score = [80,78,84,69,77,73,88,64,91,72,75,62,90,83,92,60,76,89,68,70]

def standardize(x):
    return(x- np.mean(x)) / np.std(x)
print(standardize(score) * 10 + 50)
