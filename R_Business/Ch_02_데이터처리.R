#CH_02 데이터 처리하기 
getwd()
setwd("E:/hello-git-sourcetree/R_GO/R_Business")

#데이터 불러 들어 kickboard라는 데이터 프레임으로 불러들입니다.
kickboard<-read.csv("Ch2_kickboard_sharing_data.csv",stringsAsFactors = FALSE)

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
#이 함수를 수행하면 속성 마다 NA 값이 존재할 때 TRUE값을 반환합니다. 
library(stringr)
str_detect(kickboard,"NA")

#기온 속성값에 하나의 NA값이 있음을 확인할 수 있습니다.
table(is.na(kickboard$기온..C.))
#풍속 속성값에 두개의 NA값이 있음을 확인할 수 있습니다.
table(is.na(kickboard$풍속.m.s.))

#!complete.cases()를 통해 NA값을 가지고 있는 행을 전부 출력할 수가 있다.
kickboard_NA<-kickboard[!complete.cases(kickboard),]

#첫번째 결측치 처리 방법_제외
#아래 함수는 결측지가 존재하는 값을 제외하고 나머지 행만을 출력합니다.
na.omit(kickboard)
na.exclude(kickboard)

#두번째 결측치 처리 방법_0 치환
#아래 함수를 통해 NA값을 0으로 치환하여 데이터의 결측치를 제거할 수 있습니다.
#치환은 어떠한 값을 어떻게 수정할지 충분히 고민 한 후 이행해야 합니다. 
kickboard$적설.cm.[is.na(kickboard$적설.cm.)] <- 0
table(is.na(kickboard$적설.cm.)) #확인

#세번째 결측치 처리 방법_평균 치환
#아래 함수를 통해 NA값을 평균으로 치환하여 데이터의 결측치를 제거할 수 있습니다.
#이 외에도 중앙값, 최빈값을 사용할 수 가 있습니다.
kickboard[!complete.cases(kickboard$기온..C.),] #현재 기온의 결측값 탐색 

#기온에 대한 전체 평균값으로 치환 
kickboard$기온..C.[is.na(kickboard$기온..C.)]<-mean(kickboard$기온..C., na.rm = TRUE)
kickboard[7986,] #확인

#가을 기온에 대한 전체 평균값으로 치환 
#filter 함수를 통해 기온 데이터만 따로 추출합니다.
kickboard_fall <-filter(kickboard ,계절 == 3, 기온..C.)
#추출된 데이터를 가지고 평균을내어 값을 저장합니다.
kickboard_fall_mean<-mean(kickboard_fall$기온..C.)

#평균값을 데이터에 넣어주기 
kickboard[7986,6]<-kickboard_fall_mean

#풍속 결측치 평균으로 처리하기
kickboard[!complete.cases(kickboard$풍속.m.s.),]
kickboard_wind = filter(kickboard,계절 == 3, 풍속.m.s.)
kickboard_wind_mean<-mean(kickboard_wind$풍속.m.s.)

kickboard[8381,7]<-kickboard_wind_mean
kickboard[8382,7]<-kickboard_wind_mean
#결측 열 확인 
str_detect(kickboard,"NA")

#분석 목적에 맞도록 데이터 형태 가공하기
#factor()는 범주를 변환해 줍니다.
#0,1,2,4 이라는 범주를 사람이 이해할 수 있는 문자범주 형태로 가공
kickboard$휴일여부 <-factor(kickboard$휴일여부, levels = c(0,1),
                        labels = c("아니요","네"))

kickboard$근무여부 <-factor(kickboard$근무여부, levels = c(0,1),
                        labels = c("아니요","네"))

#ordered 파라미터는 순서를 고정하게끔 합니다. 
kickboard$계절 <-factor(kickboard$계절, levels = c(1,2,3,4),
                      labels = c("봄","여름","가을","겨울"),
                      ordered = TRUE)

kickboard$날씨상황 <- factor(kickboard$날씨상황, levels =c(1,2,3,4),
                         labels = c("맑음","흐림","약한 눈 비","강한 눈 비"),
                         ordered = TRUE)
str(kickboard)

#날짜 및 시간 변환 
#strptime 함수를 활용하여 문자열 형식에서 날짜형식으로 변환 
#format 설정을 상세하게 해주지 않으면 NA값을 출력합니다.
#Y를 대문자로 설정하면 4자리 년도, 소문자로 설정하면 2자리 년도 출력
str(kickboard$날짜)

kickboard$날짜<-strptime(kickboard$날짜, format = "%Y-%m-%d %H:%M")

str(kickboard$날짜)

# 문자열 데이터를 표준형으로 가공하기 
# 변수 확인  
unique(kickboard$경로)

kickboard$경로 <- tolower(kickboard$경로) #소문자 변환 
kickboard$경로 <- str_trim(kickboard$경로) #앞 뒤 공백 제거
na_loc<-is.na(kickboard$경로) #경로의 모든 na값을 확인하고 na_loc으로 결과값 저장
str(na_loc) #na_loc 확인
kickboard$경로[na_loc] <-"unknown" # 경로로 접근해서 TRUE값을 unknown 으로 대체

#확인
unique(kickboard$경로)

#속성 간소화 하기 
library(DataCombine)
#정규 표현식을 활용하여 하나의 패턴을 만들어 내줍니다.
web_sites<- "(www.[a-z]*.[a-z]*)"


#str_subset()는 string중 해당 패턴을 가지고 있는 문자열들을 반환합니다.
current<-unique(str_subset(kickboard$경로, web_sites))
current

#rep()는 첫번째 인자를 두번째 인자만큼 반복
replace<-rep("web",length(current))
replace
#from/to 속성을 같는 데이터프레임 형식으로 만들어 줍니다.
replacements<-data.frame(from = current,to = replace)
replacements
#FindReplace()는 첫번째 파라미터로 객체를 지정해주고, 두번째는 변수명,
#세번째는 대체할 데이터, 네 다섯번째는 데이터의 from과 to 속성을 지정합니다.
#마지막 옵션은 논리값을 대체할때 사용합니다.
kickboard<-FindReplace(data = kickboard, Var = "경로", replacements, 
                       from = "from", to = "to", exact = FALSE)
unique(kickboard$경로)
#경로 변수를 범주형으로 변환하여 저장해줍니다.
kickboard$경로<-as.factor(kickboard$경로)

str(kickboard)

#데이터 저장 
write.csv(kickboard,"clean_kickboard_data.csv",row.names = FALSE)
