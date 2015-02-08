library(dplyr) 


house<-read.delim("household_power_consumption.txt",sep=";") #Reads file into R
house<-house%>%mutate(Date=as.Date(Date,"%d/%m/%Y")) #change Date Variable into Date class
house1<-house[house$Date==as.Date("2007-02-01","%Y-%m-%d") | house$Date==as.Date("2007-02-02","%Y-%m-%d"),]

#subsets  the data frame
rm("house") #removes orinal data frame from workspace


#plots and save file
png("plot1.png",width=480,height=480,units="px")
hist(as.numeric(levels(house1$Global_active_power)[house1$Global_active_power]),col="red"
     ,main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")


dev.off()
