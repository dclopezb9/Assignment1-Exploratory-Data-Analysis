install.packages("dplyr")
library(dplyr)
data<-read.csv("household_power_consumption.csv",header=TRUE,sep=";")
backUp<-data
data<-backUp
data<-tbl_df(data)
data<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)

plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="green",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_2, type="l", xlab="", ylab="",col="red",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","red","blue"))
dev.off()
#plot3