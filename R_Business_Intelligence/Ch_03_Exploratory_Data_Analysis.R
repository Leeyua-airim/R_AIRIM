#Ch_03 Exploratory Data Analysis

#R의 데이터 형태
#Numeric - R에서 숫자는 기본적으로 Numeric으로 설정됩니다.

#Integer - 소숫점이 없는 정수이며, as.integer()를 통해 형태를 변환할 수 있다.
as.integer(1.23)

#Character - 문자열을 나타냅니다. as.character()을 통해 설정해 줄 수 있으며,
#cat()로 여러 문자들을 하나로 묶어 줄 수도 있다. 
as.character(1.23)

#Logical - TRUE 혹은 FALSE로 저장되는 값 입니다.
1 == 2
1 == 1

#Factor - 범주형 변수에 적용된다. 범주의 벡터를 각각의 level로 부호화해 저장.
#이러한 구분은 범주에 따라 데이터를 필터링하고 그룹을 만들 때 매우 유용

#데이터의 형태를 알고 싶을때 class()를 활용하면 된다.
class(1.23)
class("1.23")

#하나의 변수 분석하기
#일변량 분석이라고도 하며 데이터를 분석할 때 수치와 분포를 살펴보기위한 
#str()함수를 사용한다.

#현재 경로 확인과 내가 원하는 경로 셋팅하기기
getwd()
setwd("E:/hello-git-sourcetree/R_GO/R_Business_Intelligence")
#데이터 불러오기
sns_marketing<-read.csv("Ch3_SNS_marketing.csv",stringsAsFactors = TRUE)
#str()통해 수치와 분포를 살펴보기기
str(sns_marketing)
#factor()를 통해 변수를 순서형으로 변환 시키기.
sns_marketing$타겟시장_인구밀도<-factor(sns_marketing$타겟시장_인구밀도,
                                       ordered= TRUE,
                                       levels = c("Low","Medium","High"))

#표를 활용한 데이터 탐색
#summary()는 평균을 포함하여 총 6가지의 중요한 수치를 알려줍니다.
summary(sns_marketing$유튜브광고_예산)

#R에서는 mean() / sd() / var()를 통해 평균, 표준편차, 분산을 쉽게 계산
mean(sns_marketing$유튜브광고_예산)
sd(sns_marketing$유튜브광고_예산)
var(sns_marketing$유튜브광고_예산)

#범주형 변수에 summary()적용하게 되면 레벨과 각 수준별 관측치 개수를 알려줍니다.
summary(sns_marketing$타겟시장_인구밀도)

#시각화를 활용한 데이터 탐색색
#anscombe데이터는 R에 내장되어 있는 데이터 입니다.
data("anscombe")
anscombe
#sapply()는 벡터,리스트, 표현식, 데이터 프레임 등에 함수를 적용하고 그 결과를 벡터 또는 행렬로 돌려줍니다.
sapply(sns_marketing, class) #sapply()를 통해 데이터가 가진 범주를 확인할 수도 있다. 
sapply(anscombe,mean)
sapply(anscombe,sd)
sapply(anscombe,var)

#plot()를 활
plot(sns_marketing$타겟시장_인구밀도)
boxplot(sns_marketing$유튜브광고_예산, ylab = "지출_Expenditures")
hist(sns_marketing$유튜브광고_예산, main = "지출분포")

summary(sns_marketing$페이스북광고_예산)
boxplot(sns_marketing$네이버블로그광고_예산, ylab = "지출_Expenditures",col = "gray")
hist(sns_marketing$네이버블로그광고_예산,main = NULL, col = "skyblue")

#두개의 변수 분석하기 _ 이변량 데이터분석석
summary(sns_marketing)
#변수 추가하고 제거하기 
#cut()는 두번째 파라미터로 정한 수 만큼 범주를 분리하여 저장합니다.
#즉, 종업원 수를 중앙값으로 구분하여 두 범주로 구분하도록 합니다.
sns_marketing$emp_factor<-cut(sns_marketing$종업원_수,2)
summary(sns_marketing)
#변수 제거하기 
sns_marketing$emp_factor<-NULL

#table()를 통해 두 변수에 대한 빈도표 생성
#두개의 범주형 데이터 관계는 아이디어를 제공합니다.
#결과값은 두 개의 차원에서 균등하게 보일 수도 있습니다.
table(sns_marketing$emp_factor,sns_marketing$타겟시장_인구밀도)

#시각화를 통해 살펴보기
#mosaicplot()은 두개의 범주형 데이터를 그릴 수 있습니다.
#단, table()가 포함되어야 합니다.
mosaicplot(table(sns_marketing$타겟시장_인구밀도,sns_marketing$emp_factor),
                 col = c("gray","skyblue"),main = "범주형 / 범주형",ylab = "종업원 수",xlab = "인구밀도")

#boxplot()함수에 범주형 데이터와 숫자형 데이터를 넣어 활용할 수도 있다.
boxplot(sns_marketing$총_마케팅_예산 ~ sns_marketing$타겟시장_인구밀도,
        main = "범주형 / 숫자형")
#plot() 함수를 이용해 두 변수의 숫자형 데이터에 대하여 산점도를 그릴 수 있습니다.
plot(sns_marketing$유튜브광고_예산, sns_marketing$수익, main = "숫자형 / 숫자형")

