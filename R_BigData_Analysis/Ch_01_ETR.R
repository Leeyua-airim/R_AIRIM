#R_Big_Data_Analysis
# 추출 변형 저장 _ ETL 과정

#현재 작업 경로 확인
getwd()
#내가 원하는 작업경로 설정
setwd("E:/hello-git-sourcetree/R_GO/R_BigData_Analysis")
#데이터 읽어들이기 및 객체 저장 
kickboard<-read.csv("Ch1_kickboard_sharing_data.csv")

#데이터 간단하게 살펴보기
str(kickboard)

kickboard<-read.table("Ch1_kickboard_sharing_data.txt", sep = "\t",header = TRUE)
head(kickboard)

library(dplyr)
#봄(1)과 여름(2)에 한하여 미등록자의 킥보드 대여 횟수 살펴보기
extracted_row<-filter(kickboard, 정기회원 == 0, 계절 == 1 | 계절 == 2)
head(extracted_row)

# %in% 연산자는 모든 행을 조회하고, 그 행이 사용자가 지정한 기준에 부합하는지 결정한다.
#첫번째 파라미터는 데이터 이름, 두번째 파라미터는 필터링 조건 
extracted_row_in<-filter(kickboard, 정기회원 == 0, 계절 %in% c(1,2))
#identical() 함수는 R의 두 객체를 비교하여 두 값이 모두 동일하면 TRUE 값을, 그렇지 않으면 FALSE 값을 반환.
identical(extracted_row,extracted_row_in)

#select()를 활용하면 데이터의 원하는 속성값만을 선택하여 추출할 수 가 있다.
extracted_columns<-select(extracted_row, 계절, 일일회원)
extracted_columns

#mutate()를 활용하여 계산된 속성을 기존 데이터에 삽입할 수 가 있다.
add_revenue<-mutate(extracted_columns, 수익 = 일일회원 * 1500)
add_revenue

#dplyr 패키지의 group_by()와 summarise() 함수로 데이터를 그룹별로 합계할 수 있다.
# 두 함수는 같이 사용되는 경우가 많으니 메모해 두면 좋다.
#group_by()는 데이터 프레임과 기준으로 만들고 싶은 변수를 파라미터로 취한다.
grouped <-group_by(add_revenue,계절)
grouped
#summarise()는 데이터프레임과 사용자가 요약하길 원하는 변수를 파라미터로 여긴다.
#평균, 최소, 최대, 총합 중 정확하게 선택하여야 합니다.
report<-summarise(grouped, sum(일일회원), sum(수익),mean(수익))
report

#데이터를 csv 파일로 저장하는 방법
#write.csv()함수는 데이터 프레임을 csv파일로 바꿔 준다.
#마지막 파라미터의 FALSE 값은 분석 결과의 행 번호가 함께 저장하지 않는다는 의미 입니다.
write.csv(report,"수익_리포트.csv",row.names = FALSE)
#write.table()함수도 마찬가지로 데이터프레임을 txt 파일로 저장할 수 있는 기능을 제공합니다. 
#이때 sep = 파라미터의 '\t'는 텍스트 파일을 저장할 때, 텝(tap)으로 구분하라고 알려주는 겁니다.
write.table(report,"수익_리포트.txt",row.names = FALSE, sep = "\t")
