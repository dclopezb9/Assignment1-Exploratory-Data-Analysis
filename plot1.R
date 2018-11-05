install.packages("dplyr")
library(dplyr)
data<-read.csv("household_power_consumption.csv",header=TRUE,sep=";")
backUp<-data
data<-tbl_df(data)
data<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
data<-data$Global_active_power
data<-as.numeric(as.character(data))
png("plot1.png",width=480,height=480)
hist(data,main="Global Active Power",xlab="Global Active Power (kilowatt)", ylab="Frequency",col="red")
dev.off()
#plot1