#06_Data_Story_Visuailzation
setwd("E:/hello-git-sourcetree/R_GO/R_BigData_Analysis")
plot_dat<-read.csv("Ch6_SNS_marketing.csv")
summary(plot_dat)

plot_dat$emp_size<-cut(plot_dat$employees,breaks = 3,labels = c("종업원 수 : 3-6","7-9","10+"))

library(ggplot2); library(scales)

plot<-ggplot(data = plot_dat,aes(x= marketing_total,y=revenues))

plot<-plot+facet_grid(. ~ emp_size) + geom_point(aes(color = pop_density), shape = 18, size =4 )
