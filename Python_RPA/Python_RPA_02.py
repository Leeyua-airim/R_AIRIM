#조건문으로 활성화 함수
import random
value_A = {'w': random.random(), 'b':random.random(),'a_value':0.5}
w=[]
b=[]
if 'w' in value_A:
    if 'w' in value_A:
        print("'w': ",value_A['w'],
        "\ncheck the next values")
        w.append(value_A['w'])
    if 'b' in value_A:
        print("'b' value is ", value_A['b'])
        b.append(value_A['b'])
    else:
        print("Not enough 'w'.")
else:
    print("No 'w' value.")

print("w: ",w,"\nb: ",b)
