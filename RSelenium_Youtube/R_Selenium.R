#CMD java -Dwebdriver.gecko.driver="geckodriver.exe" -jar selenium-server-standalone-3.141.59.jar -port 4445

library(httr)
library(rvest)
library(RSelenium)

remD <- remoteDriver(remoteServerAddr = 'localhost', 
                    port = 4445L, # 포트번호 입력 
                    browserName = "chrome") 
remD$open() #서버에 연결
remD$navigate("https://www.naver.com") #이 홈페이지로 이동 

html <- remD$getPageSource()[[1]] 
html <- read_html(html) #페이지의 소스 읽어오기 

sWords <- html %>% html_nodes("span.ah_k") %>% html_text() #선택된 노드를 텍스트 화

sWords[1:20] #1~20개가져오기 



id<-remD$findElement(using = "css selector", value = "input#id")
pw<-remD$findElement(using = "css selector", value = "input#pw")

id$sendKeysToElement(list("ID"))
pw$sendKeysToElement(list("PW"))

btn <- remD$findElement(using="css selector", value='input.btn_global') 
btn$clickElement()

btn$close()
