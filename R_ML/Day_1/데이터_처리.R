#=========================================================
#데이터 처리하기 
#=========================================================
getwd()
setwd("E:/AI_Edu/R_data")

#데이터 불러 들어 kickboard라는 데이터 프레임으로 불러들입니다.
kickboard <- read.csv("Ch2_kickboard_sharing_data.csv",stringsAsFactors = FALSE)

#str 함수를 이용해 데이터 확인
str(kickboard)

#이외에도 다양한 함수를 통해 데이터를 간략하게 요약하여 확인할 수 가 있다.
dim(kickboard) # 데이터프레임의 행과 열의 차원을 보여줍니다.
head(kickboard) # 데이터프레임의 처음 6개 행과 모든 속성을 보여 줍니다. 
tail(kickboard) # 데이터프레임의 마지막 6개 행과 모든 속성을 보여 줍니다.

#결함 데이터 찾아 수정하기
#is.na 는 "NA 값이다." 라는 것을 의미한다.
#이 함수를 수행하면 NA만큼 TRUE를 반환 합니다. 
table(is.na(kickboard)) 

#stringr 패키지 안에 str_detect() 함수를 사용하면 
#데이터프레임의 모든 NA 값을 찾을 수 가 있습니다.
#이 함수를 수행하면 열 마다 NA 값이 존재할 때 TRUE값을 반환합니다. 
library(stringr)
str_detect(kickboard,"NA")

#기온 속성값에 하나의 NA값이 있음을 확인할 수 있습니다.
table(is.na(kickboard$기온..C.))
#풍속 속성값에 두개의 NA값이 있음을 확인할 수 있습니다.
table(is.na(kickboard$풍속.m.s.))

#!complete.cases()를 통해 NA값을 가지고 있는 행을 전부 출력할 수가 있다.
kickboard_NA<-kickboard[!complete.cases(kickboard),]
head(kickboard_NA,10)

#==================================
#첫번째 결측치 처리 방법_제외
#==================================

#아래 함수는 결측지가 존재하는 값을 제외하고 나머지 행만을 출력합니다.
na.omit(kickboard)
na.exclude(kickboard)

#==================================
#두번째 결측치 처리 방법_치환
#==================================

#아래 함수를 통해 NA값을 0으로 치환하여 데이터의 결측치를 제거할 수 있습니다.
#치환은 어떠한 값을 어떻게 수정할지 충분히 고민 한 후 이행해야 합니다. 
kickboard$적설.cm.[is.na(kickboard$적설.cm.)] <- 0
table(is.na(kickboard$적설.cm.)) #확인

#==================================
#세번째 결측치 처리 방법_평균 치환
#==================================

#아래 함수를 통해 NA값을 평균으로 치환하여 데이터의 결측치를 제거할 수 있습니다.
#이 외에도 중앙값, 최빈값을 사용할 수 가 있습니다.
library(dplyr)
kickboard<-read.csv("Ch2_kickboard_sharing_data.csv",stringsAsFactors = FALSE)
kickboard[!complete.cases(kickboard$기온..C.),] #현재 기온의 결측값 탐색 

#기온에 대한 전체 평균값으로 치환 
kickboard$기온..C.[is.na(kickboard$기온..C.)] <- mean(kickboard$기온..C., na.rm = TRUE)
kickboard[7986,] #확인

#가을 기온에 대한 전체 평균값으로 치환
#가을 기온 데이터만 따로 추출합니다.
kickboard<-read.csv("Ch2_kickboard_sharing_data.csv",stringsAsFactors = FALSE)

kickboard_fall <- filter(kickboard,계절 == 3, 기온..C. )
kickboard_fall_mean <- mean(kickboard_fall$기온..C.)

#평균값을 데이터에 넣어주기 
kickboard[7986,6]<-kickboard_fall_mean
kickboard[7986, ]


#==================================
#주성분 분석
#==================================
#데이터 불러들이기 
autoparts <- read.csv("공정기록데이터.csv", header = TRUE)
autoparts1 <- autoparts[autoparts$prod_no == "90784-76001", c(2:11)]
autoparts2 <- autoparts1[autoparts1$c_thickness < 1000, ]
head(autoparts2)

#주성분 분석 
pca <- prcomp(autoparts2[, -10], #종속변수를 제외한 주성분 분석 정규화
              scale. = TRUE)     #정규화도 함께 진행
summary(pca)

pca$rotation

pca$rotation[,1:2]


#==================================
#최적변수 찾기
#==================================

#데이터 불러들이기 
autoparts <- read.csv("공정기록데이터.csv", header = TRUE)
autoparts1 <- autoparts[autoparts$prod_no == "90784-76001", c(2:11)]
autoparts2 <- autoparts1[autoparts1$c_thickness < 1000, ]
head(autoparts2)

#단순 회귀분석 모델 생성 
m <- lm(c_thickness ~. , data =autoparts2)
m

#전진선택법 선택 
step(m, direction = "forward")

#후진선택법 선택 
step(m, direction = "backward")

#단계별 선택법 선택 
step(m, direction = "both")

#==================================
#최적변수 찾기 - 내장 데이터 swiss
#==================================
m <- lm(Fertility ~ .,data =swiss)
summary(m)

#전진선택법 선택 
step(m, direction = "forward")

#후진선택법 선택 
step(m, direction = "backward")

#단계별 선택법 선택 
step(m, direction = "both")
