#CH_04 비즈니스 회귀분석
getwd()
setwd("E:/hello-git-sourcetree/R_GO/R_Business_Intelligence")
adverts<-read.csv("Ch4_SNS_marketing.csv"); str(adverts)

pairs(adverts)
plot(adverts$marketing_total, adverts$revenues,
     ylab = "수익", xlab = "총 마케팅 비용", main = "마케팅 비용과 수익 관계")

model_1<-lm(revenues ~ marketing_total, data =adverts)
model_1
