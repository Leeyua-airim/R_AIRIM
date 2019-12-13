#Ch_05 군집분석을 통한 데이터 마이닝닝

#ETR 프로세스 실행하기
#데이터 추출하기(Extract) 
getwd()
setwd("E:/hello-git-sourcetree/R_GO/R_BigData_Analysis")
restaurants<-read.csv("Ch5_Korea_restaurants.csv")

#SFCA 프로세스 중 요약하기(summarize)를 통해 데이터 탐색 
summary(restaurants)

#위치정보 시각화 
par(mfrow = c(1,2))
hist(restaurants$위도,col = "gray")
hist(restaurants$경도, ylim = c(0,80),col = "gray")
plot(restaurants$경도, restaurants$위도, asp = 1)
#asp 파라미터는 x축과 y축을 1:1 로 유지

#k평균 함수 실행
#다수의 실행에도 같은 결과 도출을 위해
set.seed(123)
two<-kmeans(restaurants,2)
three<-kmeans(restaurants,3)
#결과 확인 
two
three

#K평균 개별 결과 값 확인하기 
two$centers
two$size

#개별 객체들을 cbind()로 묶어 새로운 객체 생성 
clus<-cbind(restaurants, clus_2 = two$cluster, clus_3 = three$cluster)
head(clus,10)

#2개의 허브위치 선정
plot(clus$경도, clus$위도, col = two$cluster, asp =1,
     pch = two$cluster, main = "두개의 허브 위치",
     xlab = "경도",ylab = "위도")
points(two$centers[,2], two$centers[,1], pch = 23,
       col = 'maroon', bg = 'lightblue', cex =3)
text(two$centers[,2],two$centers[,1],cex = 1.1,
     col = 'black')
#plot의 col은 범주의 크기에 따라 색깔을 선정합니다.
#plot의 pch는 범주의 크기에 따라 모양을 선정합니다(example(points)).
#points의 cex는 크기를 선정합니다.

#3개의 허브위치 선정
plot(clus$경도, clus$위도, col = three$cluster, asp =1,
     pch = three$cluster, main = "세개의 허브 위치",
     xlab = "경도",ylab = "위도")
points(three$centers[,2], three$centers[,1], pch = 23,
       col = 'maroon', bg = 'lightblue', cex =3)
text(three$centers[,2],three$centers[,1],cex = 1.1,
     col = 'black')

###
age_income<-read.csv("Ch5_customers_age_income_data.csv")
str(age_income)
head(age_income)
summary(age_income)

boxplot(age_income$age ~ age_income$bin,main = "연령층")
boxplot(age_income$income ~ age_income$bin,main = "소득")
