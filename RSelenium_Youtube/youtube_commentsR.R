#java -Dwebdriver.gecko.driver="geckodriver.exe" -jar selenium-server-standalone-3.141.59.jar -port 4445

remD <- remoteDriver(remoteServerAddr = 'localhost', 
                     port = 4445L, # 포트번호 입력 
                     browserName = "chrome") 
remD$open() #서버에 연결
remD$navigate("https://www.youtube.com/watch?v=-4Hi0QDEIk4") #이 홈페이지로 이동 

#홈페이지 스크롤
remD$executeScript("window.scrollTo(0,500)")
remD$executeScript("window.scrollTo(500,1000)")
remD$executeScript("window.scrollTo(1000,1500)")



html <- remD$getPageSource()[[1]]
html <- read_html(html) #페이지의 소스 읽어오기 

ytube_comments <- html %>% html_nodes("#content-text") %>% html_text() 
ytube_comments[1:10]

ytube_comments<-gsub("\n","",ytube_comments) #데이터 정제 1
ytube_comments<-trimws(ytube_comments)

ytube_comments

write.table(ytube_comments, file = "E:/R/R셀레니움/결과물/you_comments.txt",sep=",",row.names=FALSE,
            quote = FALSE)