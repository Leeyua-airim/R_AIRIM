library(taskscheduleR)

taskscheduler_create(taskname = "AIRIM_NAVER",rscript ="E:/R/autopack/naver_works.R",days = "*",schedule = "DAILY",starttime = "09:00",startdate = format(Sys.Date(), "%Y/%m/%d"),debug = TRUE)

tt<-taskscheduler_ls()
taskscheduler_delete(taskname = "AIRIM_NAVER")

