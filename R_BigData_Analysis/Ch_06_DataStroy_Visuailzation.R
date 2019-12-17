#06_Data_Story_Visuailzation
options(scipen = 100)
setwd("E:/hello-git-sourcetree/R_GO/R_BigData_Analysis")
plot_dat<-read.csv("Ch6_SNS_marketing.csv")
summary(plot_dat)

plot_dat$emp_size<-cut(plot_dat$employees,breaks = 3,labels = c("종업원 수 : 3-6","7-9","10+"))

library(ggplot2); library(scales)

#뼈대 생성
plot<-ggplot(data = plot_dat,aes(x= marketing_total,y=revenues))
plot
#데이터 포인트 시각화
plot<-plot + facet_grid(. ~ emp_size) + geom_point(aes(color = pop_density), shape = 18, size =4 )
plot
#facet_grid()는 emp_size에 따라 세로 형태의 창으로 분리할 수 있다.
#geom_point()는 geom레이어를 추가해 모양, 사이즈, pop_density 변수에 따라 다양하게 요소를 추가시킬 수 있다.
#aes()는 ggplot함수에 필수 요소들을 모두 기본형태로 지정한다. 이외의 값은 설정값에 따라 변화

plot + scale_y_continuous(labels = comma,
                          breaks = pretty_breaks(n = 5)) +
  scale_x_continuous(labels = comma,
                     breaks = pretty_breaks(n=5))+
  scale_color_discrete(guide = guide_legend(title = "Population \n Density"))+
  xlab("마케팅 지출(원) ") + ylab("수익(원)")
