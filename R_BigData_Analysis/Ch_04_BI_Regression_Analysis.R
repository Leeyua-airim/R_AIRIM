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
#샘플링의 불확실성을 설명해주기 위한 함수
confint(sample_model)

#임의의 데이터 생성
x <- c(1,2,3,4,5,6,7,8,9,10)
y <- c(1.00,1.41,1.73,2.00,2.24,2.45,2.65,2.83,3.00,3.16)
fit_xy<-lm(y~x)
#생성된 데이터에 대한 LINE확인
par(mfrow = c( 1,3))
plot(x,y,pch = 19, main = "선형성 확인");abline(fit_xy,col = "red")
hist(fit_xy$residuals, main = "정규성 확인",col = "skyblue")
plot(fit_xy$fitted.values, fit_xy$residuals, main = "등분산성 확인", pch = 19);abline( h = 0 )

#종속변수 변환 (y값을 제곱)
y_2 <- y^2
fit_xy2<-lm(y_2~x)
#LINE 전제조건 확인
plot(x,y_2,pch = 19, main = "선형성 확인");abline(fit_xy2,col = "red")
hist(fit_xy2$residuals, main = "정규성 확인",col = "skyblue")
plot(fit_xy2$fitted.values, fit_xy2$residuals, main = "등분산성 확인", pch = 19);abline( h = 0 )

#boxcox()를 통해 종속변수의 데이터 변환 수치값을 찾습니다.
library(MASS)
par(mfrow = c(1,1))
boxcox(fit_xy)

#새로운 가상데이터 생성
x2<- c(1,5,15,30,60,120,240,480,720,1440,2880,5760,10080)
y2<- c(0.84,0.71,0.61,0.56,0.54,0.47,0.45,0.38,0.36,0.26,0.2,0.16,0.08)
#모델 생성 
fit2<-lm(y2 ~ x2)
#LINE 전제조건 확인
par(mfrow = c( 1,3))
plot(x2,y2,pch = 19, main = "선형성 확인");abline(fit2,col = "red")
hist(fit2$residuals, main = "정규성 확인",col = "skyblue")
plot(fit2$fitted.values, fit2$residuals, main = "등분산성 확인", pch = 19);abline( h = 0 )

#독립변수에 log()변환을 하여 다시 모델 재 수립 및 전제조건 확인
x2_log<-log(x2)
fit2_log<-lm(y2~x2_log)

plot(x2_log,y2,pch = 19, main = "선형성 확인");abline(fit2_log,col = "red")
hist(fit2_log$residuals, main = "정규성 확인",col = "skyblue")
plot(fit2_log$fitted.values, fit2_log$residuals, main = "등분산성 확인", pch = 19);abline( h = 0 )


#이상치 데이터 처리하기
#두 부류의 데이터 셋 생성성 
x3<- 1:20
y3<- c(1:10,4,12:20)
x4<- c(1:20, 30)
y4<- c(0.4,2.2,2.2,5.6,5.3,5.2,7.5,8.7,9.6,9.7,12.5,12.4,12.4,11.8,16.1,16,17,18.9,19.8,20.6,30.0)
#각 데이터 셋에 대한 모델 생성성
outlier_model_1<-lm(y3~x3)
outlier_model_2<-lm(y4~x4)
par(mfrow = c(1,2))
#그래프 생성 및 회귀선 
plot(x3,y3,main = "이상치가 영향력이 있는 경우");abline(outlier_model_1,col = "red")
plot(x4,y4, main = "이상치가 영향력이 없는경우");abline(outlier_model_2,col = "red")

#세번째 데이터셋 생성
x5<- c(1:20)
y5<- c(0.4,2.2,2.2,5.6,5.3,5.2,7.5,8.7,9.6,9.7,12.5,12.4,12.4,12.8,16.1,16.0,17.0,11.5,19.8,20.6)
outlier_model_3<-lm(y5~x5)W
plot(x5,y5,main = "이상치 포함");abline(outlier_model_3, col = "red")

#네번재 데이터셋 생성
x6<- c(1:19)
y6<- c(0.4,2.2,2.2,5.6,5.3,5.2,7.5,8.7,9.6,9.7,12.5,12.4,12.4,12.8,16.1,16.0,17.0,19.8,20.6)
non_outlier_model<-lm(y6~x6)
plot(x6,y6,main = "이상치 불포함");abline(non_outlier_model,col = "red")

#세번째 모델과 네번째 모델 비교
summary(outlier_model_3);summary(non_outlier_model)
#cook's distance를 활용하여 이상치 탐색색
par(mfrow = c(2,2))
plot(outlier_model_3)









