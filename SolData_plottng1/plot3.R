library(dplyr)
library(lubridate)

house<-read.delim("household_power_consumption.txt",sep=";")
house<-house%>%mutate(Date=as.Date(Date,"%d/%m/%Y"))
house1<-house[house$Date==as.Date("2007-02-01","%Y-%m-%d") | house$Date==as.Date("2007-02-02","%Y-%m-%d"),]

#png("plot3.png",width=480,height=480, units="px")
house1$DateTime<-strptime(paste(house1$Date,house1$Time),"%Y-%m-%d %H:%M:%S")

sub1<-as.numeric(levels(house1$Sub_metering_1)[house1$Sub_metering_1])
sub2<-as.numeric(levels(house1$Sub_metering_1)[house1$Sub_metering_2])
sub3<-as.numeric(levels(house1$Sub_metering_1)[house1$Sub_metering_3])
plot(house1$DateTime,sub1,type="n")
plot(house1$DateTime,sub1,color="black")
plot(house1$DateTime,sub2,color="red")
plot(house1$DateTime,sub3,color="blue")