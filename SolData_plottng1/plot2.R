library(dplyr)

house<-read.delim("household_power_consumption.txt",sep=";")
house<-house%>%mutate(Date=as.Date(Date,"%d/%m/%Y"))
house1<-house[house$Date==as.Date("2007-02-01","%Y-%m-%d") | house$Date==as.Date("2007-02-02","%Y-%m-%d"),]