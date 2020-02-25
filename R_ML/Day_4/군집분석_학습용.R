#========================================
#비지도 학습 / 군집분석 / k-mean
#========================================
#set.seed() 설정 


#데이터 불러오기  



#prod_no 변수의 "45231-3B610" 데이터 추출




#autoparts3에 새롭게 flag 컬럼 만들기 (종속변수 범주화 작업) 



#종속변수 범주화 범위 ->  32 초과 2(불량) / 20미만 3(불량) / 나머지 1(정상 20~32)



#범주화 확인 



#독립변수 수치 정규화 작업 scale() 함수 활용


#확인 



#k-mean 알고리즘을 활용하여 군집화 kmeans 함수 활용, 임의의 초기 군집 수 설정   


#군집 시각화 plot함수 와 point함수 활용 



#table 함수를 활용하여 군집한 결과 확인



#========================================
#비지도 학습 / 군집분석 / 희소 k-mean
#========================================
# sparcl 패키지 다운로드 및 불러오기



#KMeansSparseCluster.permute 함수를 사용.
#생성할 군집수 3 설정 
#계산 반복 횟수 설정 




#확인



#KMeansSparseCluster 함수를 활용하여 앞서 구한 최적 조절 모수 입력하고 다시 클러스터링




#plot 함수를 활용하여 다시 정규화
#col 인자를 사용하여 분류별로 색깔 표현



#table 함수를활용하여 군집 정확도 확인 




#========================================
#덴드로그램 시각화
#========================================
#동시출현 단어.csv 파일 불러오기 
co.matrix <- read.csv("동시출현 단어.csv")

#제일 적합한 데이터 탐색 함수 찾아서 데이터 확인하기
head(co.matrix)

#대괄호 행렬 접근법을 활용한 데이터 축소
#동시출현분석 기법의 특성상 데이터의 밑단은 대부분 희소 행렬로 존재. 
#이 또한 분석할 수 있는주제가 되지만 그 의미를 찾기가 복잡. 
small_co.matrix <- co.matrix[1:20,1:20]

#hclust함수를 활용한 거리계산. 거리 계산은 dist함수 활용
#method 는 "ward.D2" 방법이 최근 다수 활용 / ?hclust 를 검색하여 연산법 탐색 
#단, 이때 값이 너무 작은 경우 값을 키워주기 위해 행렬 전체를 제곱  
hc_avg <- hclust(dist(small_co.matrix)^2,
                 method = "ward.D2")

?hclust
#확인
hc_avg

#군집분석 시각화 - plot 함수 활용. hang / cex 인자들을 설정. 
plot(hc_avg,    #데이터 할당
     hang = -1, #하단의 값을 0부터 시작
     cex = 1)   #글자 크기


#최적의 군집 수 찾기 - rect.hclust 함수 활용
#k 인자를 통해 찾고자 하는 군집수 설정  
#border 인자를 통해 경계 색상설정 가능 
rect.hclust(hc_avg,       #데이터 할당
            k=9,          #찾고자 하는 군집수 설정 
            border="red") #경계 색상 선정

#숫자 확인 (기존 생성 객체)
small_co.matrix

#=====================================
#군집분석 클러스터링 
#=====================================

#데이터 축소 [1:20]
small_co.matrix <- co.matrix[1:20,1:20]

# 거리 계산 
# method는 유클리디안 기본 연산법 
d_co.matrix<-dist(small_co.matrix,
                  method = "euclidean")

#확인 
d_co.matrix

#군집 분석 수행.
#method에 다양한 방법 적용
hc_avg <- hclust(dist(small_co.matrix)^2,
                 method = "ward.D2")

#활용
hc_avg


#cmdscale 함수를 활용하여 다차원 척도법수행 - 
#데이터의 값들을 거리로 생각하고 2차원 상으로 나타내 주는 기법. 
d_co.matrix_cmd <- cmdscale(d_co.matrix)
d_co.matrix_cmd

#시각화 - 2차원 상에서 텍스트 들의 위치 표현 
#plot함수의 type = "n" 을 통해 스케치북 형태로 초기화 
plot(d_co.matrix_cmd,type = "n") 
#text 함수를 활용하여 행 이름별 군집화 표현 - rownames함수 활용
text(d_co.matrix_cmd,rownames(small_co.matrix))


#다중 군집화 확인 시각화

#군집 수 설정 - cutree 함수를 활용 k값은 임의로 설정
cutree_2<-cutree(tree = hc_avg, k = 2)
cutree_3<-cutree(tree = hc_avg, k = 3)
cutree_4<-cutree(tree = hc_avg, k = 4)
cutree_5<-cutree(tree = hc_avg, k = 5)

#par(mfrow = c( , ))를 설정하여 다중 시각화 준비  
par(mfrow = c(2,2))

#plot 함수를 활용하여 시각화 
#pch / cex / col / main 인자 활용
plot(d_co.matrix_cmd, pch = 16, cex = 1, col = cutree_2, main = "k = 2")
plot(d_co.matrix_cmd, pch = 16, cex = 1, col = cutree_3, main = "k = 3")
plot(d_co.matrix_cmd, pch = 16, cex = 1, col = cutree_4, main = "k = 4")
plot(d_co.matrix_cmd, pch = 16, cex = 1, col = cutree_5, main = "k = 5")
