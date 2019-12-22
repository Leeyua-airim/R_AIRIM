from os import listdir,makedirs
from os.path import isdir
from shutil import copyfile

#경로 설정
orig_dir = "E:\\python\\scandata\\" #원본 데이터 경로
out_dir = "E:\\python\\organized\\"

#orig_dir에 있는 파일 리스트를 file_list에 옮깁니다.

file_list = listdir(orig_dir)

for f_name in file_list:
    f_date = f_name[5:-4]
    f_date = f_date.split('_')
    f_date = f_date[0]
    f_date = f_date.split('-')

    year  = f_date[0]
    month = f_date[1]
    day   = f_date[2]

    #새로운 변수(경로) 생성
    target_dir = out_dir + year + "\\" + month + "\\" + day
    if not isdir(target_dir):
        #makedirs 파일 만들기
        makedirs(target_dir)

    copyfile(orig_dir+f_name, target_dir+ "\\" + f_name)
    print(orig_dir+f_name + " => " + target_dir+"\\" + f_name)
