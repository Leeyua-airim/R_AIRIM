getwd()
setwd("E:/hello-git-sourcetree/R_GO/R_BigData_Analysis")
stations<-read.csv("Ch5_bike_station_locations.csv")
restaurants<-read.csv("Ch5_Korea_restaurants.csv")
summary(stations)

hist(stations$경도, ylim = c(0,60),col = "gray")

hist(restaurants$위도,col = "gray")
hist(restaurants$경도, ylim = c(0,80),col = "gray")
plot(restaurants$경도, restaurants$위도, asp = 1)

set.seed(123)
two<-kmeans(restaurants,2)
three<-kmeans(restaurants,3)

two
three
