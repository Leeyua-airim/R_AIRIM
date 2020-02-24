#===============================================================
#DAY_3 분류 분석 - 의사결정나무
#===============================================================

#데이터 구조 및 총 건수 확인 
str(iris)

#종속변수 확인 
levels(iris$Species)

#종속변수 종류별 개수
table(iris$Species)

#데이터 무작위 분할을 위한 sample 함수
#우선 데이터의 행만큼 숫자를 데이터의 size 만큼 무작위로 섞어 인덱싱을 한다.  
set.seed(2020)

idx <- sample(x = c("train", "valid", "test"),  #sample 함수를 활용 / 어떻게 분류할 것인지 지정
              size = nrow(iris),                #분류할 데이터의 크기를 설정, nrow함수를 통해 지정
              replace = TRUE,                   #복원 추출의 여부
              prob = c(3, 1, 1))                #데이터가 분할될 비율

#확인
idx

#기존 iris데이터 셋에서 훈련데이터 , 검증 데이터, 테스트 데이터 추출
iris_train_data <- iris[idx == "train", ]  
iris_vaild_data <- iris[idx == "valid", ]
iris_test_data <- iris[idx == "test", ]

#무작위로 섞인 데이터 확인
head(iris_train_data);head(iris_vaild_data);head(iris_test_data)
table(iris_test_data$Species);table(iris_train_data$Species);table(iris_vaild_data$Species)

#오늘 사용할 라이브러리 불러오기
library(rpart)

#의사결정나무 모델 구축
iris_rpart_result <-rpart(formula = Species ~ .,     # 종속변수와 모든 독립변수에 대한 표현식 구축
                          data = iris_train_data,    # 분류 분석에 사용할 훈련 데이터 
                          control = rpart.control(minsplit = 2))  #노드의 분류 시 포함 돼야 할 최소 데이터 개수

#결과 확인 
iris_rpart_result

#시각화 라이브러리
library(rpart.plot)

#시각화 출력
rpart.plot(iris_rpart_result)

#==================================================
#분류 모델 성능 개선
#==================================================
# CP 값 조회 
iris_rpart_result$cptable

#CP값 0.0176기준 가지치기
iris_prune_tree <- prune(iris_rpart_result, cp = 0.0176)

#가지치기 후 시각화 출력
rpart.plot(iris_prune_tree)

#====================================================
#predict함수를 통한 테스트 데이터 예측 
#====================================================
#검증 데이터 예측  
predict(iris_rpart_result, iris_vaild_data, type = "class")

#예측표 생성
#검증 데이터 종속변수 추출 
val_data <- iris_vaild_data$Species

#검증 데이터 예측 값 객체화
pred_m <- predict(iris_rpart_result, iris_vaild_data, type = "class")

#데이터 프레임 생성 / (검증 데이터 , 예측 결과)
iris_predirc_df <- data.frame(val_data,pred_m)

#확인 
iris_predirc_df

#교차표 생성성
table(iris_predirc_df)

#종합 평가 
library(caret)

confusionMatrix(pred_m,val_data, mode = "everything")


##################################################

#의사결정나무 연습2 
setwd("E:/AI_Edu/R_data")
apple_df<-read.csv("apple_data.csv",stringsAsFactors = TRUE)

summary(apple_df)
str(apple_df)

boxplot(weight ~ model, data = apple_df, ylab = "무게")
boxplot(sugar ~ model, data = apple_df, ylab = "당도")
boxplot(acid ~ model, data = apple_df, ylab = "산도")

library("ggplot2")

set.seed(2021)
apple_row_index<-sample(1:nrow(apple_df), size = nrow(apple_df)*0.7)
head(apple_row_index,15)

apple_train_data <- apple_df[apple_row_index, ]
apple_test_data <- apple_df[-apple_row_index, ]

apple_rpart_result <-rpart(formula = model ~ .,
                           data = apple_train_data, 
                           control = rpart.control(minsplit = 2))

rpart.plot(apple_rpart_result)

actual <- apple_test_data$model
expect <- predict(apple_rpart_result, apple_test_data, type = "class")

confusionMatrix(expect, actual, mode = "everything")

apple_rpart_result$cptable

##### 가지치기 

apple_prune_tree <-prune(apple_rpart_result, cp = 0.0385)
rpart.plot(apple_prune_tree)

actual <-apple_test_data$model
expect <- predict(apple_prune_tree, apple_test_data,type = "class")

confusionMatrix(expect, actual)

#새로운 데이터에 대한 예측
new_data <- data.frame(weight = 200, sugar = 18, acid = 0.15, color = "적색")
predict(apple_prune_tree, new_data, type = "class")





















