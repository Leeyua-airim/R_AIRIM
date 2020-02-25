#========================================
# 회귀 분석 / t - test
#========================================

# 나노디그리 수강 전의 평가점수 
before <- c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,78,76,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)

# 나노디그리 수강 후의 평가점수 
after <- c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)

#데이터 프레임으로 두 객체를 하나로 통합



#박스플롯을 그려 비교 - name, col 인자 활용



#Shapiro-Wilk 검정(샘플수가 적은경우) 
#임의의 벡터를 생성하여 저장 
shapiro_test_vector <-c(74,87,89,98,65,82,70,70,70)

#shapiro.test 함수를 통해 검정
shapiro.test(shapiro_test_vector)

#데이터가 일정 수 이상이 되면 t - test 검정 실시 가능 
#t-검정 함수 
t.test(x,                           # A집단 벡터
       y,                           # B집단 벡터
       paired = TRUE,               # 대응표본인 경우 TRUE, 독립표본인 경우 FALSE
       var.equal = TRUE,            # 두 집단이 같다면 TRUE, 다르면 FALSE
       alternative = "two.sided")   # 양측검정, 단측검정 설정 

#분산의 동일 여부 확인하기
#서로 길이가 다른 경우
#서로 다른 길이의 벡터 2개 생성 - 10개 이상씩
var_test_vector1 <- c()
var_test_vector2 <- c()

#var.test함수로 분산 동일 여부 테스트


#나노디그리 과정 전 학생들의 평가점수
before_score<- c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,78,76,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)

#나노디그리 과정 후 학생들의 평가점수 
after_score <- c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)

# t검정 수행 


# t검정 수행 - alternative = "less"


# t검정 수행 - alternative = "greater"



#========================================
# 회귀 분석 / 로지스틱
#========================================
#회귀분석
lm(formula = ,data = )

#데이터 확인
str(cars)
#단순 회귀분석 모델 구축 
lm_result<-lm(formula = dist ~ speed, data = cars)
#결과 확인 
summary(lm_result)

#결과 시각화
plot(cars$speed, cars$dist)
abline(lm_result, col="red")

#회귀모델의 적합성 판정 그래프 4종
par(mfrow = c(2,2))
plot(lm_result)

#로지스틱 회귀분석 

#데이터 준비하기 및 불러들이기


#데이터 불러들이기 


#데이터 확인


#모델명 "90784-76001"만을 사용하여 진행.


#데이터 확인 및 이상치 탐색



#독립변수와 종속변수의 이상치 제거(#1000 이하인 값만을 사용)

 

#데이터 확인



#종속변수 범주화하여 새로운 변수에 저장
#c_thichness값이 20보다 크거나 또는 32보다 작다는 조건에 부합하면 1, 아니면 0에 할당)
# ifelse 함수 ( 조건식 , yes , no )



#종속변수 범주화 도표 구축( 대략 13%가 블량)




#종속변수 펙터형으로 변환 as.factor함수 활용
#(로지스틱 회귀분석은 종속변수가 범주형입니다.)


#glm함수를 활용하여 로지스틱 회귀모형 모델 구축 
#이때 연속형 종속변수 제외 
#family = binomial(logit)를 알려주며 로지스틱 회귀라고 알려줌.




# summary함수를 통해 모델의 통계적 유의성 확인




#데이터 랜덤 샘플링 / 학습 , 검증 , 테스트




#확인


#기존 데이터 셋에서 훈련데이터 , 검증 데이터, 테스트 데이터 추출




#nrow 함수를 통해 데이터의 수 확인 



#학습데이터로 로지스틱 회귀모형 모델 생성(load_time변수 제외)





#훈련 데이터에 대해 모델을 학습시키고,훈련데이터를 예측한 결과 입니다. 1이 될 확률 즉, 불량품으로 분류될 확률)



#기준값 설정하기(0.5이상이면 불량(1), 0.5보다 낮으면 정상(1))
#ifelse 함수를 통해 조건을 걸어 0과 1로 분류


#확인


#AIC함수를 활용하여 AIC수치를 활용한 모델 비교평가 # 낮을수록 좋은 모형



#step함수를 활용하여 최적 변수 찾기 및 성능 평가 ,
#후진 선택법 #전진 선택법



#빈도표 작성하기 
#gmodels 라이브러리 불러오기
#CrossTable 함수 활용하여 학습 데이터 정답과 예측 결과 비교





#predict함수를 통해 훈련된 모델과 검증 데이터를 넣어 예측값을 구합니다.
#type은 "response"



#결과 확인 


#Epi 라이브러리 불러오기 

#모델 평가를 위한 ROC 커브 그리고 AUC 구하기
#ROC 함수를 활용하여 그려봅니다.






#데이터 예측
#임의의 새로운 데이터 생성
new_data <-data.frame(fix_time = 87, a_speed = 0.609, b_speed = 1.715, separation = 242.7,
                      s_separation = 657.5, rate_terms = 95, mpa = 78,highpressure_time = 82)

#predict함수를 활용하여 예측
#type은 "response"





#결과 확인
#ifelse를 통해 0.5 기준으로 yes면 1, no면 0으로 코드 작성  



#다항 로지스틱 회귀모델 구축
#다항 종속변수 생성 (20미만일때 1(불량), 아니면 두번째 조건에서 32 미만이면 2(정상), 아니면 3(불량2))
autoparts2$g_class <-as.factor(ifelse(autoparts2$c_thickness < 20, 1, ifelse(autoparts2$c_thickness < 32, 2,3)))
table(autoparts2$g_class)

#데이터 랜덤 샘플링 인덱스 설정
t_index <- sample(1:nrow(autoparts2), size = nrow(autoparts2) * 0.7)

#학습 데이터 70%, 테스트 데이터 30% 분할
train <- autoparts2[t_index, ]
test <- autoparts2[-t_index, ]

#확인
head(train)

library(nnet)
#모델 학습
multi_logistic_model <- multinom(formula = g_class ~ fix_time + a_speed + b_speed + separation + s_separation + rate_terms + mpa + highpressure_time, data = train)
#모델의 계수정보 확인
summary(multi_logistic_model)

#검증 데이터로 예측값 및 정확도 구하기
yhat_test <- predict(multi_logistic_model,test)

#교차테이블 생성
CrossTable(test$g_class, y = yhat_test, prop.chisq = FALSE)

#ROC 커브 그리고 AUC 구하기
ROC(test = yhat_test, stat = test$g_class, plot = "ROC", AUC = TRUE, main = "Logistics Regresstion")
