#CH_04 비즈니스 회귀분석
getwd()
setwd("E:/hello-git-sourcetree/R_GO/R_Business_Intelligence")
options(scipen = 100) #지수표기법 전환

#데이터 읽어들이기 및 데이터 확인
adverts<-read.csv("Ch4_SNS_marketing.csv")
str(adverts)
#데이터의 전체 변수 상관관계 시각화
pairs(adverts)

#수익과 마케팅 비용의 상관관계 시각화
plot(adverts$marketing_total, adverts$revenues,
     ylab = "수익", xlab = "총 마케팅 비용",
     main = "마케팅 비용과 수익 관계")

#선형 회귀식 만들기
model_1<-lm(revenues ~ marketing_total, data =adverts)
model_1

#LINE의 L(Linearity) 선형성 확인하기
#산점도에 회귀선 그리기_선형
abline(coef(model_1))





















