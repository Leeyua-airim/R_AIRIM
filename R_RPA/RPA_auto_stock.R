
library(clipr)
library(sendgridr)
library(KeyboardSimulator)
library(xlsx)

mouse.move(423, 701)
mouse.click("right")
mouse.move(436, 585,duration = 0.3)
mouse.click()

Sys.sleep(1)

keybd.press("d+a+u+m+space+s+t+o+c+k")
Sys.sleep(0.5)
keybd.press("enter")
Sys.sleep(1)

mouse.move(168,272,duration = 1)
mouse.click(button = "left",hold = TRUE)
mouse.move(401,340,duration = 2)
mouse.release()

keybd.press("ctrl+c")

Sys.sleep(1)

read_text<-read_clip()

today_stock<-data.frame(read_text)
today_stock

today_day<-Sys.Date()

write.xlsx(x = today_stock,file = paste("E:/stock/",today_day,".xlsx",sep = ""))

mail() %>% 
  from("brink9205@gmail.com", "에이림") %>% 
  #cc() %>% 
  #bcc("brink1@naver.com", "에이림 구독자님") %>% 
  to("brink0@naver.com", "에이림 구독자님") %>% 
  subject("안녕하세요. 오늘 09시 기준 'Daum' 의 주식 정보 입니다 :) ") %>% 
  content("오늘 오전 9시 기준 주식 거래 데이터 입니다.")  %>% 
  attachments(paste("E:/stock/",today_time,".xlsx",sep = "")) %>% 
  send()


