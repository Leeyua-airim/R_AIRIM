#CMD java -Dwebdriver.gecko.driver="geckodriver.exe" -jar selenium-server-standalone-3.141.59.jar -port 4445

library(httr)
library(rvest)
library(RSelenium)

remD <- remoteDriver(port = 4445L, # 포트번호 입력 
                     browserName = "chrome") #사용할 브라우저 

remD$open() #서버에 연결
title_you <- "에이림 인공지능"

remD$navigate(paste0("https://www.youtube.com/results?search_query=",title_you)) #해당 홈페이지로 이동 

html <- remD$getPageSource()[[1]]
html <- read_html(html) #페이지의 소스 읽어오기 

youtube_title <- html %>% html_nodes("#video-title") %>% html_text() #선택된 노드를 텍스트 화
youtube_title[1:20] #1~20개가져오기 


youtube_title<-gsub("\n","",youtube_title) #데이터 정제 1
youtube_title<-trimws(youtube_title) #데이터 정제 2

youtube_title

write.table(youtube_title, file = "E:/R/R셀레니움/결과물/에이림_title.txt",sep=",",row.names=FALSE,
            quote = FALSE)

