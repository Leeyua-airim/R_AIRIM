#open()의 w모드는 쓰기 모드입니다.
f = open('test.txt','w')
f.write('문자열 쓰기\n')
f.close()

#open()의 a모드는 추가하기 모드입니다.
f= open('test.txt','a')
f.write('문자열 추가하기\n')
f.close()

#open()의 r모드는 읽기모드 입니다.
f =open('test.txt','r')
contents = f.readline()
print(contents)
f.close()

#read()는 모든 문자열을 읽습니다.
f = open('test.txt','r')
contents = f.read()
print(contents)
f.close()

#
f = open('test.txt','r+')
contents = f.read()
print(contents)
f.write('문자열 추가 테스트\n')
f.close()
