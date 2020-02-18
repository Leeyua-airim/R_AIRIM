getwd()                   #작업경로 확인
setwd("E:/AI_Edu/R_data") #작업 경로 설정

wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE) #데이터 불러오기

str(wbcd)
summary(wbcd)

wbcd <- wbcd[-1] #첫번째 열, ID변수 삭제

table(wbcd$diagnosis) #두번째 변수값 확인  

#머신러닝 분류기는 종속 변수가 factor 타입으로 코딩되야 합니다. #Benignd양성  Malignant악성 
wbcd$diagnosis<- factor(wbcd$diagnosis, 
                        levels = c("B","M"),
                        labels = c("Benign","Malignant")) 


str(wbcd$diagnosis) #확인


#양성과 악성의 비율을 확인하기 위해 prop.table() 활용
round(prop.table(table(wbcd$diagnosis)) * 100, digits = 2) 

#일부 데이터 확인
summary(wbcd[c("radius_mean","area_mean","smoothness_mean")])

#변수값 정규화
normalize <- function(x){
  return((x - min(x)) / (max(x) - min(x)))
}
#테스트
normalize(c(1,2,3,4,5))
normalize(c(10,20,30,40,50))

#lapply()를 이용하여 norm함수 전체 적용
wbcd_n<-as.data.frame(lapply(wbcd[2:31], normalize))

summary(wbcd_n$area_mean)

#학습 데이터와 테스트 데이터로 분할 [행,열]
#이미 랜덤샘플링된 데이터 셋
wbcd_train<-wbcd_n[1:469,]
wbcd_test <-wbcd_n[470:569,]

#목표 변수 데이터셋 형성
wbcd_train_labels<-wbcd[1:469,1]
wbcd_test_labels<-wbcd[470:569,1]

install.packages("class")
library(class)

wbcd_test_pred <- knn(train = wbcd_train, 
                 test = wbcd_test, 
                 cl = wbcd_train_labels, 
                 k =21)


install.packages("gmodels")
library(gmodels)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)

#데이터 표준화
wbcd_z <- as.data.frame(scale(wbcd[-1])) 
#-1은 첫번째 변수 데이터를 제외한 모든 변수 데이터를 의미
summary(wbcd_z$area_mean)

#표준화 이후 데이터 재분할
wbcd_train <- wbcd_z[1:469, ]
wbcd_test <- wbcd_z[470:569, ]
wbcd_train_labels <- wbcd[1:469,1]
wbcd_test_labels <- wbcd[470:569,1]
wbcd_test_pred <- knn(train = wbcd_train, 
                      test = wbcd_test,
                      cl = wbcd_train_labels,
                      k = 21)
#교차 테이블 작성
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)


# 교차검증 수행으로 최적의 k 찾기
library(e1071)

test_out<-tune.knn(x= wbcd_train, y= wbcd_train_labels, k=1:10)
test_out

plot(test_out)

# 다양한 K 값을 할당해보기
k <- 
wbcd_test_pred_n <- knn(train = wbcd_train, 
                        test = wbcd_test,
                        cl = wbcd_train_labels,
                        k = k)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred_n, prop.chisq = FALSE)

#새로운 데이터에 대한 판단
new.data<-as.data.frame(read.csv("knn_test_data.csv"))
new.data

knn(wbcd_train, new.data, wbcd_train_labels, k = 10)



#연습 데이터
autoparts<-read.csv("C:/Users/leeyua/PLAYER_MAKER/R_learnr/공정기록데이터.csv",header = TRUE)

summary(autoparts)

autoparts1 <- autoparts[autoparts$prod_no == "90784-76001", c(2:11)]

summary(autoparts1)

summary(autoparts1$c_thickness)

boxplot(autoparts1$c_thickness)

autoparts2 <- autoparts1[autoparts1$c_thickness < 1000, ]

summary(autoparts2$c_thickness)

head(autoparts2$c_thickness)

ifelse()

autoparts2$y_faulty <- ifelse(test = (autoparts2$c_thickness < 20) | (autoparts2$c_thickness > 32),
                              yes = 1,
                              no  = 0)

head(autoparts2)



t_index <- sample(1:nrow(autoparts2),
                  size = nrow(autoparts2)*0.7)

train <- autoparts2[t_index, ]
test <- autoparts2[-t_index, ]

#학습데이터 알아보기 쉽게 저장
#학습데이터_독립변수
xmat.train <- as.matrix(train[1:9])
head(xmat.train)

#학습데이터_종속변수
y_faulty.train <- train$y_faulty
y_faulty.train <- as.factor(y_faulty.train)

#테스트 데이터_독립변수
xmat.test<-as.matrix(test[1:9])
head(xmat.test)



tune.out<-tune.knn(x = xmat.train, 
                   y = y_faulty.train, k=1:10)


plot(tune.out)

str(xmat.train)
str(as.factor(y_faulty.train))


test_out<-tune.knn(x= wbcd_train,y= wbcd_train_labels, k=1:10)
plot(test_out)
