remotes::install_github("mrchypark/sendgridr")
install.packages("clipr")
library(sendgridr)
library(clipr)
auth_set(force = T)
mail() %>% 
  from("brink9205@gmail.com", "에이림") %>% 
  #cc() %>% 
  #bcc() %>% 
  to("brink0@naver.com", "R 구독자 여러분들") %>% 
  #to("brink1@naver.com", "R 구독자 여러분들") %>% 
  subject("안녕하세요. 오늘 ABCD 기업의 주식 정보 입니다 :) ") %>% 
  content("오늘기준 주식 거래 데이터 입니다.")  %>% 
  #attachments() %>% 
  send()