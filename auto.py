def test_sum(a,b):
    c = a + b
    print(c)
    return c

num1 = 100
num2 = 200

result = test_sum(num1,num2)

if result < 200:
    print('hello')
print(result)