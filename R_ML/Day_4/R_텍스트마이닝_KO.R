library(RHINO)
initRhino() #처음 한번만 초기화
.libPaths() #자신의 R 경로 확인 

#경로설정 
setwd("E:/AI_Edu/R_data")
#텍스트 데이터 읽어들이기 
txt <- readLines("2018신문기사.txt")
#형태소 분석
noun <- lapply(txt,getMorph, "noun") #noun - 일반명사
noun_Vec <- unlist(noun) #벡터 타입으로 변환
noun_Max<-matrix(noun_Vec) #행렬 타입으로 변환
noun_Frame<-as.data.frame(noun_Max) #데이터 프레임으로 변환

noun_Freq<-table(noun_Frame) #도수분포표로 변환

head(sort(noun_Freq, decreasing = T),20) #결과 확인 내림차순 20개


#문서 행렬화 라이브러리
library(tm)
#명사로 구성된 객체를 벡터화
corpus <- VCorpus(VectorSource(noun))
head(corpus)

stopWord <- c("종합")

#문서의 단어 출현 행렬 표현
tdm <- TermDocumentMatrix(x = corpus,
                          control=list(
                            removePunctuation=TRUE, #구두점 제거  
                            stopwords=stopWord, #선정한 단어 제외
                            removeNumbers=TRUE,  #숫자 제거
                            wordLengths=c(2, 7), #글자 길이 제한 2~7자
                            weighting=weightBin)) #해당 단어 출현시 1, 아니면 0

tdm
#한글 깨짐현상이 나타날때
#Encoding(tdm$dimnames$Terms) = 'UTF-8'

#정제된 객체 매트릭스화
tdm_matrix <- as.matrix(tdm)

#출현 단어 수 확인
word_count<- rowSums(tdm_matrix) #출현단어 합 계산
word_order <- order(word_count, decreasing=TRUE) #내림차순 
freq_words <- tdm_matrix[word_order[1:120], ] #갯수 한정 
co.matrix <- freq_words %*% t(freq_words) #문서 단어 출현 빈도 계산 


#csv파일로 저장
write.csv(co.matrix,"E:/AI_Edu/R_data/동시출현 단어.csv")


#출현단어 빈도분석
freq_words_df<- as.data.frame(head(sort(word_count,decreasing = T),20))
freq_words_df