#Python_RPA
#01_파이썬_알고가자!
print("hello")
#'변수'와 '자료형'이란?
age = 27
name = "airim"
print(age)
print(name)
#숫자 자료형과 연산자
x = 2
y = 6
data = y/x
data = x*y
data = y % x #나머지를 구하는 연산자
data = y // x #몫을 구하는 연산자
print(data)

#문자열 자료형
msg = "hello airim"
print(msg)
msg = "'hello airim'"
print(msg)
msg = '"hello airim"'
print(msg)
#이스케이프 코드 \' \" \n \t \\
msg = '"hello \'airim\'"'
print(msg)
msg = '"hello \'airim!\'"\n"Hi"'
print(msg)
#''' / """ 을 활용하면 더 쉽게 문자열을 작성할 수 있다.
msg = '''hello airim!
Hi!
'''
print(msg)

#문자열 연산은 + 과 * 가 지원하고 있다.
data = '^' + '_' + '^'
print(data)
data = data * 10
print(data)

#인덱스
msg = "hello python"
print(msg[0])
print(msg[1])
#print(msg[12]) <-범위를 넘어가게 되면 에러를 반환합니다.
print(msg[11])

#음수를 적용하여 활용할 수도 있습니다.
print(msg[-1])
print(msg[-11])

#슬라이싱 변수명[시작인덱스 '이상' : 끝 인덱스 '미만']
print(msg[0:5])
print(msg[:])
print(msg[:5])
print(msg[6:])

#내장함수 count : 특정문자의 수를 반환합니다.
data = "hello python"
l_count=data.count('l')
print(l_count)
blank_count = data.count(' ')
print(blank_count)
print(data.count('python'))

#내장함수 find : 특정 문자의 위치를 반환합니다.
data = "hello python"
o_find = data.find('o')
print(o_find)
#두번째 위치를 찾고싶을 때
sec_find=data.find('o',o_find+1)
print(sec_find)

#내장함수 join : 문자열 자료형 변수의 값을 함수의 전달값으로 받은 변숫값의 사이에 추가합니다.
sep_key = ','
data = sep_key.join('one')
print(data)
#리스트 자료형과 함께 사용하기
data = sep_key.join(['one','two','three','four'])
print(data)

#내장함수 replace : 일부 문자열을 다른 문자열로 치환한 결과를 반환합니다.
data = "hello python"
Repalce_data = data.replace('python','AIRIM')
print(Repalce_data)
#replace()는 ''를 통해 일부 문자열을 제거할 수도 있습니다.
removed_data = data.replace('python','')
print(removed_data)

#내장함수 split : 문자열을 원하는 문자열로 쪼개는 함수 입니다.
data = 'hello python and RPA'
split_data = data.split(' ')
print(split_data)
print(split_data[0])
print(split_data[2])

#내장함수 strip() : 문자열의 앞뒤 공백을 제거하는 함수입니다.
data = '     2020-09-12   '
print(data)
data = data.strip()
print(data)

#내장함수 isdigit() : 문자열이 숫자로만 이뤄져 있는지 여부를 반환하는 함수입니다.
data = '1234'
print(data.isdigit())
data = 'hello python'
print(data.isdigit())

#문자열 포멧팅 : 특정코드(%s,%d...)를 문자열에 입력하고, 해당 코드에 변수를 대입해 주는 방식
name = 'AIRIM'
res = 'My youtube_ch is %s' %(name)
print(res)

view = 1000
res = 'My youtube_ch is "%s" and %d Sub'%(name,view)
print(res)

#리스트 자료형 : 리스트 자료형은 꼭 같은 자료형이 아니어도 됩니다.
list_type = []
list_type = ['1,2,3,4']
list_type = ['one',2,'three',4]
print(list_type)

#리스트 인덱스
data = ['hello','python','RPA','R']
print(data[0])
print(data[2])
print(data[-1])
print(data[-3])
#del()를 통해 리스트의 요소를 지울 수도 있다.
del(data[3])
print(data)

#append() 리스트 맨 마지막에 값을 추가해주는 함수 입니다.
data = []
data.append('hello python')
print(data)
data.append('R')
print(data)
data.append(['RPA'])
print(data)

#sort() 문자열 혹은 숫자형 데이터를 정렬하여 반환합니다.
data = ['aad','aac','aaa']
data.sort()
print(data)

#insert() 리스트 내 원하는 위치에 값을 추가할 수 있는 함수.
data = ['hello','RPA','Python']
data.insert(3,'R')
print(data)
data.insert(255,'JAVA')
print(data)

#remove() 리스트 내 원하는 값을 지정하여 삭제할 수 있습니다.
data = ['R','RPA','PYTHON','JAVA']
data.remove('JAVA')
print(data)

#튜플 자료형 : 데이터의 모음을 나타내는 자료형
#튜플 자료형은 리스트와 달리 삭제할 수가 없다.
data = (1,2,3)
print(data)
data = (1,)
print(data)
data = (1)
print(data)

#튜플형을 수정하고 싶을때는 리스트형으로 전환하여야 한다.
data = (1,2,3)
l_data=list(data)
l_data[0] = 10
del(l_data[2])
print(l_data)
t_data=tuple(l_data)
print(t_data)

#딕셔너리 자료형 : 키(key)와 값(value)형태로 구성되어 있습니다.
#딕셔너리 자료형은 키를 통해 접근할 수가 있습니다.
student = {'name':'airim','age':27,'e-mail':'abcd@gmail.com'}
print(student['name'])

sample={}
sample['name'] = 'airim'
sample['age'] = 27
print(sample)

#keys()는 딕셔너리가 가진 모든 키를 dict_keys객체로 반환합니다.
student = {'name':'airim','age':27,'e-mail':'abcd@gmail.com'}
student_keys=student.keys()
print(student_keys)

#values()는 딕셔너리가 가진 모든 값을 dict_values객체로 반환합니다.
student_values=student.values()
print(student_values)

#
