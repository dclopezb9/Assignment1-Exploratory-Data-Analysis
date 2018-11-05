install.packages("dplyr")
library(dplyr)
data<-read.csv("household_power_consumption.csv",header=TRUE,sep=";")
backUp<-data
data<-backUp
data<-tbl_df(data)
data<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data<-data$Global_active_power
data<-as.numeric(as.character(data))
png("plot2.png",width=480,height=480)
plot(datetime, data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#plot2