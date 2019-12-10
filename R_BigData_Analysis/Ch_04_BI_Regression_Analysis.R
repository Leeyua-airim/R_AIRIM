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

#LINE의 N(Normality)정규성 확인하기
par(mfrow = c(1,2)) #한 행에 두개의 표 그리기
#잔차 히스토그램으로 확인해보기
hist(model_1$residuals, xlab = "Residuals", col = "gray",
     main = "잔차의 분포")
#Q-Q도표를 활용하여 확인해보기
qqnorm(model_1$residuals, main = "잔차의 Q-Q분포")
qqline(model_1$residuals,col = "red")

#LINE의 E(Equal variance)등분산성 확인하기
par(mfrow = c(1,1))
plot(model_1$fitted.values, model_1$residuals, ylab = "잔차",
     xlab = "예측값_Fitted Values", main = "잔차의 분포")
abline(0,0,lwd = 3) 
abline(h = c(-6500,6500), lwd=3,lty=3)
#lwd : 선의 굵기
#lty : 선의 모양
#h:수평선일때 y값

#모델 분석결과 해석
summary(model_1)

#마케팅 비용 범위 확인하기
range(adverts$marketing_total)

library(dplyr)
#파이프연산자 %>% 는 ctrl + shift + m 단축기로 쉽게 사용할 수 있습니다.
select(adverts, marketing_total) %>% filter(marketing_total > 480000)

#새로운 데이터 프레임 생성 
new_data <-data.frame(marketing_total = 500000)
#예측
predict.lm(model_1,newdata = new_data, interval = "predict")
#신뢰구간 선택 후 예측 
predict.lm(model_1,newdata = new_data,level = 0.99 ,interval = "predict")

#다중 변수값 예측
new_data_2<-data.frame(marketing_total = c(450000,490000,530000))
predict.lm(model_1,newdata = new_data_2, interval = "predict")

#랜덤 무작위 샘플링 
#seed는 나중에 분석을 다시 실시했을때도 동일한 결과를 얻기 위함.
set.seed(1234) 
market_sample<-sample_frac(adverts,0.3,replace = FALSE)
#샘플 데이터 모델 생성
sample_model <- lm(revenues ~ marketing_total, data = market_sample)
sample_model
#샘플링의 불확실성을 설명해주기 위한 함수수
confint(sample_model)












































